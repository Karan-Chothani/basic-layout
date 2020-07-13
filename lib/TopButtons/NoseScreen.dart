import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';

class NoseScreen extends StatelessWidget {

  Widget makeImagesGrid(){
    return GridView.builder(
        itemCount: 3,
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount (crossAxisCount: 3),
        itemBuilder: (context,index){
          return ImageGridItem(index);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nose"),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        child: makeImagesGrid(),
      ),
    );
  }
}

// ignore: must_be_immutable
class ImageGridItem extends StatefulWidget {

  int _index;


  ImageGridItem(int index){
    this._index = index;
  }

  @override
  _ImageGridItemState createState() => _ImageGridItemState();
}

class _ImageGridItemState extends State<ImageGridItem> {

  Uint8List imagefile;
  StorageReference noseReference = FirebaseStorage.instance.ref().child("noses");

  getImage(){
    int MAX_SIZE = 4*1024*1024;
    noseReference.child("nose${widget._index}.jpg").getData(MAX_SIZE).then((data){
      this.setState((){
        imagefile = data;
      });
    }).catchError((error){

    });
  }

  Widget checkGridTileWidget(){
    if (imagefile == null){
      return Center(child: Text("No Data"));
    } else{
      return Card(
        elevation: 10.0,
        child: new Column(
          children: <Widget>[
            new GestureDetector(
                child:new Image.memory(imagefile, fit: BoxFit.cover,),
                onTap:(){
                  print("hii");
                }
            ),
            new SizedBox(height: 5.0,), //to add space
            new Text("Nose"),
          ],
        ),
        //child: new Image.memory(imagefile, fit: BoxFit.cover,height: 90.0,width: 100.0,),
      );
    }
  }

  @override
  void initState(){
    super.initState();
    getImage();
  }

  @override
  Widget build(BuildContext context) {
    return GridTile(child: checkGridTileWidget());
  }
}
