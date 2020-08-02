import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:imagebutton/imagebutton.dart';
import 'package:matrix_gesture_detector/matrix_gesture_detector.dart';


import 'FacialAddition.dart';
import 'SideMenu.dart';
import 'TopButtons/EyeScreen.dart';
import 'TopButtons/LowerFace.dart';
import 'TopButtons/NoseScreen.dart';
import 'TopButtons/LipsScreen.dart';
import 'TopButtons/FaceOutline.dart';

import 'Tabs/ListTab.dart';
import 'Tabs/UserTab.dart';
import 'Tabs/NotificationTab.dart';
import 'Tabs/StarTab.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int itemNo;
  bool sd = false;
  Timer timer;

  var disable = false;

  double scale = 0.0;
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();
  final ValueNotifier<Matrix4> notifier1 = ValueNotifier(Matrix4.identity());
  final ValueNotifier<Matrix4> notifier2 = ValueNotifier(Matrix4.identity());
  final ValueNotifier<Matrix4> notifier3 = ValueNotifier(Matrix4.identity());
  final ValueNotifier<Matrix4> notifier4 = ValueNotifier(Matrix4.identity());
  final ValueNotifier<Matrix4> notifier5 = ValueNotifier(Matrix4.identity());

  double h1 = 100;
  double w1 = 100;
  double h2 = 100;
  double w2 = 100;
  double h3 = 100;
  double w3 = 100;
  double h4 = 100;
  double w4 = 100;


  var f1Image = [
    "images/facialfeatures/outline1/1.png",
    "images/facialfeatures/outline1/2.png",
    "images/facialfeatures/outline1/3.png",
  ];

  var f2Image = [
    "images/facialfeatures/outline2/1.png",
    "images/facialfeatures/outline2/2.png",
    "images/facialfeatures/outline2/3.png",
  ];

  var eImage = [
    "images/facialfeatures/eyes/1.png",
    "images/facialfeatures/eyes/2.png",
    "images/facialfeatures/eyes/3.png",
  ];

  var nImage = [
    "images/facialfeatures/nose/1.png",
    "images/facialfeatures/nose/2.png",
    "images/facialfeatures/nose/3.png",
  ];

  var lImage = [
    "images/facialfeatures/lips/1.png",
    "images/facialfeatures/lips/2.png",
    "images/facialfeatures/lips/3.png",
    "images/facialfeatures/lips/4.png",
  ];

  /// Face Container Height & Width
  double height = 200;
  double eh = 200;
  double ew = 200;
  double nh = 100;
  double nw = 300;
  double lh = 100;
  double lw = 100;
  double o2h = 200;
  double o2w = 200;

  var val = new GlobalKey();
  var scr = new GlobalKey();

  /// Index of each swipers
  var faceoutline1index = 1;
  var faceoutline2index = 1;
  var eyesindex = 1;
  var noseindex = 1;
  var lipsindex = 1;

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    var assetsImage = new AssetImage('images/nose.png');
    var image = new Image(image: assetsImage, );
    return Scaffold(
      drawer: SideMenu(),
      appBar: AppBar(
        title: Text('J.AI.STICE'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
    child: Container(
    height: _screenSize.height * 0.9,
    decoration: BoxDecoration(
    image: DecorationImage(
    image: AssetImage("images/wal.jpg"),
    fit: BoxFit.fill,
    ),
    ),
        child: new Column(
          children: <Widget>[
            new Container(
              //color: Colors.blue[100],
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(2.0),
                    child: new Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        RaisedButton(
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EyeScreen()));
                          },
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: <Widget>[
                                  Image(image: AssetImage("images/eyes.png"))
                                ],
                              )
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        RaisedButton(
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NoseScreen()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: <Widget>[
                                Image(image: AssetImage("images/nose.png"))
                              ],
                            )
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        RaisedButton(
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LipsScreen()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: <Widget>[
                                Image(image: AssetImage("images/lips.png"))
                              ],
                            )
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        RaisedButton(
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Forehead()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: <Widget>[
                                Image(image: AssetImage("images/forehead.png"))
                              ],
                            )
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        RaisedButton(
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Lowerface()));
                          },
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: <Widget>[
                                  Image(image: AssetImage("images/lowerface.png"))
                                ],
                              )
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 520,
              height: _screenSize.height * 0.74,
              child: Center(
                child: RepaintBoundary(
                  key: scr,
                  child: Stack(
                    children: <Widget>[
                      /// Outline 1
                      Container(
                        height: _screenSize.height * 0.5,
                        child: new Column(
                          children: <Widget>[
                            new SizedBox(
                              height: _screenSize.height * 0.5,
                              child: new Swiper(
                                key: val,
                                itemBuilder:
                                    (BuildContext context, faceoutline1) {
                                  return new Image.asset(
                                      f1Image[faceoutline1]);
                                },
                                itemCount: f1Image.length,
                                itemWidth: 300,
                                itemHeight: 300,
                                index: this.faceoutline1index,
                                onIndexChanged: (int faceoutline1) {
                                  this.faceoutline1index = faceoutline1;
                                },
                                control: new SwiperControl(
                                  iconPrevious:
                                  disable ? null : Icons.arrow_back_ios,
                                  iconNext: disable
                                      ? null
                                      : Icons.arrow_forward_ios,
                                ),
                                layout: SwiperLayout.CUSTOM,
                                customLayoutOption: CustomLayoutOption(
                                    startIndex: -1, stateCount: 3)
                                    .addRotate([
                                  0 / 180,
                                  0.0,
                                  0 / 180
                                ]).addTranslate([
                                  Offset(-400.0, 0.0),
                                  Offset(0.0, 0.0),
                                  Offset(370, -40.0),
                                ]),
                              ),
                              width: 600,
                            ),
                          ],
                        ),
                      ),

                      /// Outline 2
                      Align(
                        child: MatrixGestureDetector(
                          onMatrixUpdate: (m, tm, sm, rm) {
                            notifier5.value = m;
                          },
                          shouldRotate: false,
                          // shouldScale: true,
                          // shouldTranslate: false,
                          child: AnimatedBuilder(
                            animation: notifier5,
                            builder: (ctx, child) {
                              return Transform(
                                transform: notifier5.value,
                                child: Stack(
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment(0, 1.2),
                                      child: Container(
                                        width: o2w,
                                        height: o2h,
                                        //color: Colors.purple,
                                        child: new SizedBox(
                                          child: Swiper(
                                            physics:
                                            NeverScrollableScrollPhysics(),
                                            onTap: (faceoutline2index){
                                              itemNo = 4;
                                            },
                                            itemBuilder:
                                                (BuildContext context,
                                                faceoutline2index) {
                                              return Image.asset(
                                                f2Image[faceoutline2index],
                                              );
                                            },
                                            itemCount: f2Image.length,
                                            itemWidth: 300,
                                            itemHeight: 600,
                                            index: this.faceoutline2index,
                                            onIndexChanged:
                                                (int faceoutline2) {
                                              this.faceoutline2index =
                                                  faceoutline2;
                                            },
                                            control: new SwiperControl(
                                                padding:
                                                EdgeInsets.only(top: 60),
                                                iconPrevious: disable
                                                    ? null
                                                    : Icons.arrow_back_ios,
                                                iconNext: disable
                                                    ? null
                                                    : Icons.arrow_forward_ios,
                                                color: Colors.red),
                                            layout: SwiperLayout.DEFAULT,
                                            customLayoutOption:
                                            CustomLayoutOption(
                                                startIndex: -1,
                                                stateCount: 3)
                                                .addRotate([
                                              0 / 180,
                                              0.0,
                                              0 / 180
                                            ]).addTranslate([
                                              Offset(-400.0, 0.0),
                                              Offset(0.0, 0.0),
                                              Offset(370, -40.0),
                                            ]),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),

                      /// EYES
                      Align(
                        child: MatrixGestureDetector(
                          onMatrixUpdate: (m, tm, sm, rm) {
                            notifier1.value = m;
                          },
                          shouldRotate: false,
                          // shouldScale: true,
                          // shouldTranslate: false,
                          child: AnimatedBuilder(
                            animation: notifier1,
                            builder: (ctx, child) {
                              return Transform(
                                transform: notifier1.value,
                                child: Stack(
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment(0, -0.1),
                                      child: Tooltip(
                                        message: "Eyes Selected",
                                        child: Container(
                                          width: ew,
                                          height: eh,
                                          //color: Colors.purple,
                                          child: new SizedBox(
                                            child: Swiper(
                                              onTap: (eyesindex){
                                                itemNo = 1;
                                              },
                                              itemBuilder:
                                                  (BuildContext context,
                                                  eyesindex) {
                                                return Image.asset(
                                                  eImage[eyesindex],
                                                );
                                              },
                                              itemCount: eImage.length,
                                              itemWidth: 300,
                                              itemHeight: 600,
                                              index: this.eyesindex,
                                              onIndexChanged: (int eyes) {
                                                this.eyesindex = eyes;
                                              },
                                              layout: SwiperLayout.DEFAULT,
                                            ),
                                            height: 200,
                                            width: 350,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),

                      /// NOSE
                      Align(
                        child: MatrixGestureDetector(
                          onMatrixUpdate: (m, tm, sm, rm) {
                            notifier2.value = m;
                          },
                          shouldRotate: false,
                          // shouldScale: true,
                          // shouldTranslate: false,
                          child: AnimatedBuilder(
                            animation: notifier2,
                            builder: (ctx, child) {
                              return Transform(
                                transform: notifier2.value,
                                child: Stack(
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment(0, 0.1),
                                      child: Tooltip(
                                        message: "Nose Selected",
                                        child: Container(
                                          width: nw,
                                          height: nh,
                                          child: new SizedBox(
                                            child: Swiper(
                                              onTap: (noseindex){
                                                itemNo = 2;
                                              },
                                              itemBuilder:
                                                  (BuildContext context,
                                                  noseindex) {
                                                return Image.asset(
                                                    nImage[noseindex]);
                                              },
                                              itemCount: nImage.length,
                                              itemWidth: 100,
                                              itemHeight: 100,
                                              index: this.noseindex,
                                              onIndexChanged: (int nose) {
                                                this.noseindex = nose;
                                              },
                                              layout: SwiperLayout.DEFAULT,
                                            ),
                                            height: 500,
                                            width: 650,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),

                      /// LIPS
                      Align(
                        child: MatrixGestureDetector(
                          onMatrixUpdate: (m, tm, sm, rm) {
                            notifier3.value = m;
                          },
                          shouldRotate: false,
                          // shouldScale: true,
                          // shouldTranslate: false,
                          child: AnimatedBuilder(
                            animation: notifier3,
                            builder: (ctx, child) {
                              return Transform(
                                transform: notifier3.value,
                                child: Stack(
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment(0.0, 0.5),
                                      child: Tooltip(
                                        message: "Lips Selected",
                                        child: Container(
                                          width: lw,
                                          height: lh,
                                          //color: Colors.purple,
                                          child: new SizedBox(
                                            child: Swiper(
                                              onTap: (flipsindex){
                                                itemNo = 3;
                                              },
                                              itemBuilder:
                                                  (BuildContext context,
                                                  lipsindex) {
                                                return Image.asset(
                                                    lImage[lipsindex]);
                                              },
                                              itemCount: lImage.length,
                                              itemWidth: 500,
                                              itemHeight: 600,
                                              index: this.lipsindex,
                                              onIndexChanged: (int lips) {
                                                this.lipsindex = lips;
                                              },
                                              //control: new SwiperControl(),
                                              layout: SwiperLayout.DEFAULT,
                                            ),
                                            height: 500,
                                            width: 650,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 70,0),
              child: RaisedButton(
                color: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onPressed: next,
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Text(
                    'Add Facial Featurs',
                    style: TextStyle(fontSize: 23, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
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

  void zoomin() {
    setState(() {
      if (itemNo == 1) {
        print(itemNo);
        eh = eh + 10;
        ew = ew + 10;
      } else if (itemNo == 2) {
        print(itemNo);
        nh = nh + 10;
        nw = nw + 10;
      } else if (itemNo == 3) {
        print(itemNo);
        lh = lh + 10;
        lw = lw + 10;
      } else if (itemNo == 4) {
        print(itemNo);
        o2h = o2h + 10;
        o2w = o2w + 10;
      } else {
        alertPopUp(context);
      }
    });
  }

  void zoomout() {
    setState(() {
      if (itemNo == 1) {
        print(itemNo);
        eh = eh - 10;
        ew = ew - 10;
      } else if (itemNo == 2) {
        print(itemNo);
        nh = nh - 10;
        nw = nw - 10;
      } else if (itemNo == 3) {
        print(itemNo);
        lh = lh - 10;
        lw = lw - 10;
      } else if (itemNo == 4) {
        print(itemNo);
        o2h = o2h - 10;
        o2w = o2w - 10;
      } else {
        alertPopUp(context);
      }
    });
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

  next() {
    setState(() {
      disable = true;
    });
    timer = new Timer(const Duration(milliseconds: 500), () {
      takeScreenShot();
    });
  }

  takeScreenShot() async {
    //Swiper s1 = val.currentContext.widget;
    //SwiperController swiperControl = s1.controller;
    RenderRepaintBoundary boundary = scr.currentContext.findRenderObject();
    var image = await boundary.toImage();

    var byteData = await image.toByteData(format: ImageByteFormat.png);
    setState(() {
      disable = false;
    });

    var png = byteData.buffer.asUint8List();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => new FacialAdd(photo: png),
      ),
    );
  }
}

