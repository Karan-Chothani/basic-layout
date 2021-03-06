import 'package:firebasetogrid/PrintIndex.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';

class Forehead extends StatelessWidget {

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
        title: Text("Upper Face"),
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
  int custom;
  int count = 1;

  ImageGridItem(int index){
    this._index = index;
    //print("INdex: $_index");
  }

  @override
  _ImageGridItemState createState() => _ImageGridItemState();
}

class _ImageGridItemState extends State<ImageGridItem> {

  Uint8List imagefile;
  StorageReference eyeReference = FirebaseStorage.instance.ref().child("FaceOutline");

  getImage(){
    int MAX_SIZE = 4*1024*1024;
    eyeReference.child("face${widget._index}.png").getData(MAX_SIZE).then((data){
      this.setState((){
        imagefile = data;
        //print(widget._index);
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
                child:new Image.memory(imagefile, fit: BoxFit.scaleDown,height: 100,width: 100, ),
                onTap:(){
                  print("INDEX");
                  print(widget._index);
                  //print("abc");
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>PrintIndex(index: widget._index,)));
                }
            ),
            new SizedBox(height: 5.0,), //to add space
            new Text("Upper Face"),
          ],
        ),
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