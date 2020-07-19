import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:matrix_gesture_detector/matrix_gesture_detector.dart';

import 'TopButtons/EyeScreen.dart';
import 'TopButtons/NoseScreen.dart';
import 'TopButtons/LipsScreen.dart';

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
  int _currentIndex = 0;
  int itemNo;
  bool sd = false;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firegrid demo'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: new Column(
          children: <Widget>[
            new Container(
              color: Colors.blue[100],
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
            new Container(
              color: Colors.purple[100],
              height: 574.5,
              //width: 1000.0,
              child: new Stack(
                children: <Widget>[
                  new MatrixGestureDetector(
                    onMatrixUpdate: (m, tm, sm, rm) {
                      notifier1.value = m;
                      itemNo = 1;
                      setState(() {
                        sd = true;
                      });
                    },
                    // shouldRotate: false,
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
                                alignment: Alignment(0.0, -0.85),
                                child: Container(
                                  width: w1,
                                  height: h1,
                                  //color: Colors.green[100],
                                  //color: Colors.purple,
                                  child: DragTarget(
                                    builder: (context, List<int> candidateData,
                                        rejectedData) {
                                      print(candidateData);
                                      return Center(
                                        child: Image(
                                          image: AssetImage('images/part1.jpg'),
                                          height: h1,
                                          width: w1,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  new MatrixGestureDetector(
                    onMatrixUpdate: (m, tm, sm, rm) {
                      notifier2.value = m;
                      itemNo = 2;
                      setState(() {
                        sd = true;
                      });
                    },
                    // shouldRotate: false,
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
                                alignment: Alignment(0.0, -0.35),
                                child: Container(
                                  width: w2,
                                  height: h2,
                                  //color: Colors.purple,
                                  child: DragTarget(
                                    builder: (context, List<int> candidateData,
                                        rejectedData) {
                                      print(candidateData);
                                      return Center(
                                        child: Image(
                                          image: AssetImage('images/part2.jpg'),
                                          height: h2,
                                          width: w2,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  new MatrixGestureDetector(
                    onMatrixUpdate: (m, tm, sm, rm) {
                      notifier3.value = m;
                      itemNo = 3;
                      setState(() {
                        sd = true;
                      });
                    },
                    // shouldRotate: false,
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
                                alignment: Alignment(0.0, 0.15),
                                child: Container(
                                  width: w3,
                                  height: h3,
                                  //color: Colors.purple,
                                  child: DragTarget(
                                    builder: (context, List<int> candidateData,
                                        rejectedData) {
                                      print(candidateData);
                                      return Center(
                                        child: Image(
                                          image: AssetImage('images/part3.jpg'),
                                          height: h3,
                                          width: w3,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  new MatrixGestureDetector(
                    onMatrixUpdate: (m, tm, sm, rm) {
                      notifier4.value = m;
                      itemNo = 4;
                      setState(() {
                        sd = true;
                      });
                    },
                    // shouldRotate: false,
                    // shouldScale: true,
                    // shouldTranslate: false,
                    child: AnimatedBuilder(
                      animation: notifier4,
                      builder: (ctx, child) {
                        return Transform(
                          transform: notifier4.value,
                          child: Stack(
                            children: <Widget>[
                              Align(
                                alignment: Alignment(0.0, 0.65),
                                child: Container(
                                  width: w4,
                                  height: h4,
                                  //color: Colors.purple,
                                  child: DragTarget(
                                    builder: (context, List<int> candidateData,
                                        rejectedData) {
                                      print(candidateData);
                                      return Center(
                                        child: Image(
                                          image: AssetImage('images/part4.jpg'),
                                          height: h4,
                                          width: w4,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  sd == true ?
                  new SpeedDial(
                    animatedIcon: AnimatedIcons.menu_arrow,
                    animatedIconTheme: IconThemeData(size: 24.0),
                    closeManually: false,
                    marginRight: 21.5,
                    marginBottom: 23.5,
                    curve: Curves.easeIn,
                    overlayColor: Colors.black,
                    overlayOpacity: 0.3,
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.purple,
                    //tooltip: "Speed Dial123",
                    //closeManually: true,
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
                        onTap: null,
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
                        onTap:null,
                      ),
                    ],
                  ) :
                  new Visibility(child: new SizedBox(), visible: false,) ,
                ],
              ),
            ),
            new Container(
              color: Colors.blue[100],
              height: 60.2,
              child: new Stack(
                children: <Widget>[
                  new Align(
                    alignment: Alignment.center,
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
            ) //Recommend
          ],
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
    if (itemNo == 1) {
      print(itemNo);
      h1 = h1 + 10;
      w1 = w1 + 10;
    } else if (itemNo == 2) {
      print(itemNo);
      h2 = h2 + 10;
      w2 = w2 + 10;
    } else if (itemNo == 3) {
      print(itemNo);
      h3 = h3 + 10;
      w3 = w3 + 10;
    } else if (itemNo == 4) {
      print(itemNo);
      h4 = h4 + 10;
      w4 = w4 + 10;
    } else {
      print("NULL");
    }
    setState(() {});
  }

  void zoomout() {
    setState(() {
      if (itemNo == 1) {
        print(itemNo);
        h1 = h1 - 10;
        w1 = w1 - 10;
      } else if (itemNo == 2) {
        print(itemNo);
        h2 = h2 - 10;
        w2 = w2 - 10;
      } else if (itemNo == 3) {
        print(itemNo);
        h3 = h3 - 10;
        w3 = w3 - 10;
      } else if (itemNo == 4) {
        print(itemNo);
        h4 = h4 - 10;
        w4 = w4 - 10;
      } else {
        print("NULL");
      }
    });
  }
}