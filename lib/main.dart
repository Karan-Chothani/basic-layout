import 'package:flutter/material.dart';

import 'TopButtons/EyeScreen.dart';
import 'TopButtons/NoseScreen.dart';
import 'TopButtons/LipsScreen.dart';

import 'Tabs/ListTab.dart';
import 'Tabs/UserTab.dart';
import 'Tabs/NotificationTab.dart';
import 'Tabs/StarTab.dart';

void main (){
  runApp(
    new MaterialApp(
     title: "Firegrid demo",
      theme: ThemeData(
        primarySwatch: Colors.purple
      ),
      home: App(),
    )
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {

  int _currentIndex = 0;

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
                height: 50.0,
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
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context)=>EyeScreen())
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Eyes',
                                style: TextStyle(fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(width: 5.0,),
                          RaisedButton(
                            color: Colors.purple,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context)=>NoseScreen())
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Nose',
                                style: TextStyle(fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(width: 5.0,),
                          RaisedButton(
                            color: Colors.purple,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context)=>LipsScreen())
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Lips',
                                style: TextStyle(fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(width: 5.0,),
                          RaisedButton(
                            color: Colors.purple,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context)=>EyeScreen())
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Cheeks',
                                style: TextStyle(fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(width: 5.0,),
                          RaisedButton(
                            color: Colors.purple,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context)=>EyeScreen())
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Face Style',
                                style: TextStyle(fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            new Container(child: new SizedBox(height: 586.0,width: 1000.0,),),
            new Container(
              child: RaisedButton(
                color: Colors.purple,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onPressed: () {
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Recommendation',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
            //buttonrecommend,
          ],
        ),
      ),

      bottomNavigationBar:BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
          currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home ,color: Colors.white),
            title: new Text('Home' , style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.list,color: Colors.white),
              title: new Text('List', style: TextStyle(color: Colors.white)),
              backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person,color: Colors.white),
              title: new Text('User', style: TextStyle(color: Colors.white)),
              backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications,color: Colors.white),
              title: new Text('Notification', style: TextStyle(color: Colors.white)),
              backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.stars,color: Colors.white),
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
      switch (_currentIndex){
        case 0:{ }
        break;
        case 1:{ Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ListTab()));}
        break;
        case 2:{ Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UserTab()));}
        break;
        case 3:{ Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NotificationTab()));}
        break;
        case 4:{ Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => StarTab()));}
        break;
      }
    });
  }
}

Widget buttonrecommend = new Container(
  child: new Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      RaisedButton(
        color: Colors.purple,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)),
        onPressed: () {
          Navigator(onGenerateRoute: null);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Recommendation',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    ],
  ),
);
