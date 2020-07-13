import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'TopButtons/EyeScreen.dart';
import 'TopButtons/NoseScreen.dart';
import 'TopButtons/LipsScreen.dart';
import 'Tabs/ListTab.dart';
import 'Tabs/UserTab.dart';
import 'Tabs/NotificationTab.dart';
import 'Tabs/StarTab.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:matrix_gesture_detector/matrix_gesture_detector.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  int itemNo;

  double scale = 0.0;
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();
  final ValueNotifier<Matrix4> notifier1 = ValueNotifier(Matrix4.identity());
  final ValueNotifier<Matrix4> notifier2 = ValueNotifier(Matrix4.identity());
  final ValueNotifier<Matrix4> notifier3 = ValueNotifier(Matrix4.identity());
  final ValueNotifier<Matrix4> notifier4 = ValueNotifier(Matrix4.identity());

  double h1 = 100;
  double w1 = 100;
  double h2 = 100;
  double w2 = 100;
  double h3 = 100;
  double w3 = 100;
  double h4 = 100;
  double w4 = 100;

  var fImage = [
    "images/outline/1.png",
    "images/outline/2.png",
    "images/outline/3.png",
  ];

  var eImage = [
    "images/eyes/1.png",
    "images/eyes/2.png",
    "images/eyes/3.png",
  ];
  var nImage = [
    "images/nose/1.png",
    "images/nose/2.png",
    "images/nose/3.png",
  ];

  var lImage = [
    "images/lips/1.png",
    "images/lips/2.png",
    "images/lips/3.png",
    "images/lips/4.png",
  ];
  double height = 200;
  double eh = 200;
  double ew = 200;
  double nh = 100;
  double nw = 300;
  double lh = 100;
  double lw = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firegrid demo'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Container(
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
                            color: Colors.purple,
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
                              child: Text(
                                'Eyes',
                                style:
                                    TextStyle(fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          RaisedButton(
                            color: Colors.purple,
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
                              child: Text(
                                'Nose',
                                style:
                                    TextStyle(fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          RaisedButton(
                            color: Colors.purple,
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
                              child: Text(
                                'Lips',
                                style:
                                    TextStyle(fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          RaisedButton(
                            color: Colors.purple,
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
                              child: Text(
                                'Cheeks',
                                style:
                                    TextStyle(fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          RaisedButton(
                            color: Colors.purple,
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
                              child: Text(
                                'Face Style',
                                style:
                                    TextStyle(fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              ///Main Container
              new Container(
                width: 550,
                height: 586,
                child: Container(
                  child: Stack(
                    children: <Widget>[
                      /// Main FACE OUTLINE
                      Center(

                        child: new Column(
                          children: <Widget>[
                            new SizedBox(
                              child: new Swiper(
                                itemBuilder: (BuildContext context, int index) {
                                  return new Image.asset(fImage[index]);
                                },
                                itemCount: fImage.length,
                                itemWidth: 300,
                                itemHeight: 500,
                                control: new SwiperControl(),
                                layout: SwiperLayout.CUSTOM,
                                customLayoutOption: CustomLayoutOption(
                                        startIndex: -1, stateCount: 3)
                                    .addRotate(
                                        [0 / 180, 0.0, 0 / 180]).addTranslate([
                                  Offset(-400.0, 0.0),
                                  Offset(0.0, 0.0),
                                  Offset(370, -40.0),
                                ]),
                              ),
                              height: 500,
                              width: 600,
                            ),
                          ],
                        ),
                      ),

                      /// EYES
                      new Align(
                        child: MatrixGestureDetector(
                          onMatrixUpdate: (m, tm, sm, rm) {
                            itemNo = 1;
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
                                      alignment: Alignment(0, -0.6),
                                      child: Container(
                                        width: ew,
                                        height: eh,
                                        //color: Colors.purple,
                                        child: new SizedBox(
                                          child: Swiper(
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Image.asset(
                                                eImage[index],
                                              );
                                            },
                                            itemCount: eImage.length,
                                            itemWidth: 200,
                                            itemHeight: 200,
                                            //control: new SwiperControl(),
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
                                          height: 200,
                                          width: 350,
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
                      new Align(
                        child: MatrixGestureDetector(
                          onMatrixUpdate: (m, tm, sm, rm) {
                            notifier2.value = m;
                            itemNo = 2;
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
                                      alignment: Alignment(0, -0.3),
                                      child: Container(
                                        width: nw,
                                        height: nh,
                                        //color: Colors.purple,
                                        child: new SizedBox(
                                          child: Swiper(
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Image.asset(nImage[index]);
                                            },
                                            itemCount: nImage.length,
                                            itemWidth: 100,
                                            itemHeight: 100,
                                            //control: new SwiperControl(),
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
                                          height: 500,
                                          width: 650,
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
                      new Align(
                        child: MatrixGestureDetector(
                          onMatrixUpdate: (m, tm, sm, rm) {
                            notifier3.value = m;
                            itemNo = 3;
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
                                      alignment: Alignment(0.0, -0.1),
                                      child: Container(
                                        width: lw,
                                        height: lh,
                                        //color: Colors.purple,
                                        child: new SizedBox(
                                          child: Swiper(
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Image.asset(lImage[index]);
                                            },
                                            itemCount: lImage.length,
                                            itemWidth: 500,
                                            itemHeight: 600,
                                            //control: new SwiperControl(),
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
                                          height: 500,
                                          width: 650,
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

                      /// SPEED DIAL BUTTONS
                      new Align(
                        child: new SpeedDial(
                          animatedIcon: AnimatedIcons.menu_arrow,
                          animatedIconTheme: IconThemeData(size: 24.0),
                          closeManually: true,
                          marginRight: 21.5,
                          marginBottom: 23.5,
                          curve: Curves.easeIn,
                          overlayColor: Colors.black,
                          overlayOpacity: 0.3,
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.purple,
                          children: [
                            SpeedDialChild(
                              child: Icon(
                                Icons.zoom_in,
                                size: 30,
                              ),
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.purple,
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
                              backgroundColor: Colors.purple,
                              label: "Zoom Out",
                              labelStyle: TextStyle(fontSize: 14.5),
                              onTap: zoomout,
                            ),
                          ],
                        ),
                      ),

                      ///RECOMMEND BUTTON
                      new Align(
                        alignment: Alignment(0,0.98),
                        child: new RaisedButton(
                          color: Colors.purple,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Recommendation',
                              style: TextStyle(fontSize: 23, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white),
            title: new Text('Home', style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list, color: Colors.white),
            title: new Text('List', style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.white),
            title: new Text('User', style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications, color: Colors.white),
            title:
                new Text('Notification', style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stars, color: Colors.white),
            title: new Text('Star', style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.purple,
          ),
        ],
        onTap: onTabTapped,
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      switch (_currentIndex) {
        case 0:
          {}
          break;
        case 1:
          {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ListTab()));
          }
          break;
        case 2:
          {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => UserTab()));
          }
          break;
        case 3:
          {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NotificationTab()));
          }
          break;
        case 4:
          {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => StarTab()));
          }
          break;
      }
    });
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
      } else {
        print("NULL");
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
      } else {
        print("NULL");
      }
    });
  }
}
