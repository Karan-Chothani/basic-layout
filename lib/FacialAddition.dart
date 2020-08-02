import 'dart:async';

import 'package:firebasetogrid/TopButtons/EyesFetching.dart';
import 'package:firebasetogrid/TopButtons/MouthFetching.dart';
import 'package:firebasetogrid/TopButtons/NoseFetching.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'dart:ui';

// ignore: must_be_immutable
class FacialAdd extends StatefulWidget {
  final List photo;
  FacialAdd({this.photo});
  @override
  _FacialAddState createState() => _FacialAddState(this.photo);
}

class _FacialAddState extends State<FacialAdd> {
  final List photo;
  _FacialAddState(this.photo);
  Timer timer;
  int itemNo;
  var disable=false;
  double scale = 0.0;
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();
  var val=new GlobalKey();
  final ValueNotifier<Matrix4> notifier1 = ValueNotifier(Matrix4.identity());
  final ValueNotifier<Matrix4> notifier2 = ValueNotifier(Matrix4.identity());
  final ValueNotifier<Matrix4> notifier3 = ValueNotifier(Matrix4.identity());
  final ValueNotifier<Matrix4> notifier4 = ValueNotifier(Matrix4.identity());
  final ValueNotifier<Matrix4> notifier5 = ValueNotifier(Matrix4.identity());
  var scr = new GlobalKey();

  var hImage = [
    "images/facialaddition/hats/1.png",
    "images/facialaddition/hats/2.png",
    "images/facialaddition/hats/3.png",
  ];

  var gImage = [
    "images/facialaddition/glass/1.png",
    "images/facialaddition/glass/2.png",
    "images/facialaddition/glass/3.png",
  ];

  var mImage = [
    "images/facialaddition/mustach/4.png",
    "images/facialaddition/mustach/5.png",
    "images/facialaddition/mustach/8.png",
  ];

  var bImage = [
    "images/facialaddition/beard/2.png",
    "images/facialaddition/beard/4.png",
    "images/facialaddition/beard/3.png",
  ];

  double height = 200;
  double hh = 300;
  double hw = 300;
  double sh = 100;
  double sw = 200;
  double mh = 150;
  double mw = 150;
  double bh = 200;
  double bw = 200;

  /// Index of each swipers
  var hatindex = 1;
  var glassindex = 1;
  var mustacheindex = 1;
  var beardindex = 1;

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Facial Features'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Container(
            height: _screenSize.height*0.9,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/wal.jpg"),
                fit: BoxFit.fill,
              ),
            ),
            child: new Column(
                children: <Widget>[
                  /// TOP BAR
                  new Container(
                    height: _screenSize.height*0.07,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(2.0),
                          child: new Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                width: 5.0,
                              ),
                              RaisedButton(
                                color: Colors.blueAccent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => NoseFetch()));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Hats',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              RaisedButton(
                                color: Colors.blueAccent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MouthFetch()));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Specs',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              RaisedButton(
                                color: Colors.blueAccent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => EyesFetch()));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Mustache',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              RaisedButton(
                                color: Colors.blueAccent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => EyesFetch()));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Beards',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  new SizedBox(
                    height: 560,
                  ),
                  /// Recommend Button
                  Container(
                      child: RaisedButton(
                        color: Colors.red,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        onPressed: (){},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Recommend',
                            style: TextStyle(fontSize: 23, color: Colors.white),
                          ),
                        ),
                      ))
                ])
        ),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_arrow,
        animatedIconTheme: IconThemeData(size: 24.0),
        closeManually: true,
        marginRight: 25.5,
        marginBottom: 15.5,
        curve: Curves.easeIn,
        overlayColor: Colors.black,
        overlayOpacity: 0.3,
        foregroundColor: Colors.white,
        backgroundColor: Colors.red,
        children: [
          SpeedDialChild(
            child: Icon(
              Icons.zoom_in,
              size: 30,
            ),
            foregroundColor: Colors.white,
            backgroundColor: Colors.red,
            label: "Zoom In",
            labelStyle: TextStyle(fontSize: 14.5),
            onTap: zoomin,
          ),
          SpeedDialChild(
            child: Icon(
              Icons.zoom_out,
              size: 30,
            ),
            foregroundColor: Colors.white,
            backgroundColor: Colors.red,
            label: "Zoom Out",
            labelStyle: TextStyle(fontSize: 14.5),
            onTap: zoomout,
          ),
        ],
      ),
    );
  }

  void alertPopUp(BuildContext context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Please Select Features"),
          content: new Text("Select the facial features you want to resize"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void zoomin() {
    setState(() {
      if (itemNo == 1) {
        print(itemNo);
        hh = hh + 30;
        hw = hw + 30;
      } else if (itemNo == 2) {
        print(itemNo);
        sh = sh + 10;
        sw = sw + 10;
      } else if (itemNo == 3) {
        print(itemNo);
        mh = mh + 10;
        mw = mw + 10;
      } else if (itemNo == 4) {
        print(itemNo);
        bh = bh + 10;
        bw = bw + 10;
      } else {
        alertPopUp(context);
      }
    });
  }

  void zoomout() {
    setState(() {
      if (itemNo == 1) {
        print(itemNo);
        hh = hh - 10;
        hw = hw - 10;
      } else if (itemNo == 2) {
        print(itemNo);
        sh = sh - 10;
        sw = sw - 10;
      } else if (itemNo == 3) {
        print(itemNo);
        mh = mh - 10;
        mw = mw - 10;
      } else if (itemNo == 4) {
        print(itemNo);
        bh = bh - 10;
        bw = bw - 10;
      } else {
        alertPopUp(context);
      }
    });
  }

}
