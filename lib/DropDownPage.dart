import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:firebasetogrid/Home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui';
import 'package:shared_preferences/shared_preferences.dart';

class DropDownPage extends StatefulWidget {
  @override
  _DropDownPageState createState() => _DropDownPageState();
}

class _DropDownPageState extends State<DropDownPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: RequirementPage(),
    );
  }
}

class RequirementPage extends StatefulWidget {
  @override
  _RequirementPageState createState() => _RequirementPageState();
}

class _RequirementPageState extends State<RequirementPage> {
  SharedPreferences prefs;

  List<String> mouth_str = List<String>();
  List<String> eye_str = List<String>();
  List<String> nose_str = List<String>();
  List<String> forehead_str = List<String>();
  List<String> lowerface_str = List<String>();

  List<String> moustache_str = List<String>();
  List<String> hats_str = List<String>();
  List<String> glass_str = List<String>();
  List<String> beard_str = List<String>();

  List<String> mouth_criminal = List<String>();
  List<String> eye_criminal = List<String>();
  List<String> nose_criminal = List<String>();
  List<String> forehead_criminal = List<String>();
  List<String> lowerface_criminal = List<String>();

  var loading = false;
  List<String> gender = ["Male", "Female"];
  List<String> eye_size = ["Large", "Small", "Medium"];
  List<String> eye_shape = ["Slanted", "Round"];
  List<String> nose_length = ["Long", "Short"];
  List<String> nose_width = ["Wide", "Narrow"];
  List<String> nose_type = ["Round", "Pointy"];
  List<String> mouth = ["Big", "Thin", "Medium"];
  List<String> faceshape = [
    "Round",
    "Diamond",
    "Square",
    "Triangle",
    "Heart",
    "Oblong"
  ];
  List<String> forehead_type = ["Small", "Medium", "Large"];
  List<String> has_beard = [
    "Yes",
    "No",
  ];
  List<String> has_moustache = [
    "Yes",
    "No",
  ];

  var _currentGender;
  var _currentEyeSize;

  var _currentEyeShape;

  var _currentNoseLength;

  var _currentNoseWidth;
  var _currentNoseType;
  var _currentMouth;

  var _currentFaceShape;

  var _currentForeheadType;
  var male = false;
  var _hasmoustache;
  var _hasbeard;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("List"),
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
              Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text("Gender",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Times new roman",
                          fontSize: 15)),
                  DropdownButton<String>(
                    autofocus: true,
                    items: gender.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: "times new roman",
                                fontSize: 15)),
                      );
                    }).toList(),
                    onChanged: (String newValueSelected) {
                      // Your code to execute, when a menu item is selected from drop down
                      setState(() {
                        _currentGender = newValueSelected;
                        if (_currentGender == "Male") {
                          male = true;
                        } else {
                          male = false;
                        }
                      });
                    },
                    value: _currentGender,
                  )
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text("Face Shape",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Times new roman",
                          fontSize: 15)),
                  DropdownButton<String>(
                    items: faceshape.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Times new roman",
                                fontSize: 15)),
                      );
                    }).toList(),
                    onChanged: (String newValueSelected) {
                      // Your code to execute, when a menu item is selected from drop down
                      setState(() {
                        _currentFaceShape = newValueSelected;
                      });
                    },
                    value: _currentFaceShape,
                  )
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text("Forehead Type",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Times new roman",
                          fontSize: 15)),
                  DropdownButton<String>(
                    items: forehead_type.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Times new roman",
                                fontSize: 15)),
                      );
                    }).toList(),
                    onChanged: (String newValueSelected) {
                      // Your code to execute, when a menu item is selected from drop down
                      setState(() {
                        _currentForeheadType = newValueSelected;
                      });
                    },
                    value: _currentForeheadType,
                  )
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text("Eye Size",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Times new roman",
                          fontSize: 15)),
                  DropdownButton<String>(
                    autofocus: true,
                    items: eye_size.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: "times new roman",
                                fontSize: 15)),
                      );
                    }).toList(),
                    onChanged: (String newValueSelected) {
                      // Your code to execute, when a menu item is selected from drop down
                      setState(() {
                        _currentEyeSize = newValueSelected;
                      });
                    },
                    value: _currentEyeSize,
                  )
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text("Eye Shape",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Times new roman",
                          fontSize: 15)),
                  DropdownButton<String>(
                    autofocus: true,
                    items: eye_shape.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: "times new roman",
                                fontSize: 15)),
                      );
                    }).toList(),
                    onChanged: (String newValueSelected) {
                      // Your code to execute, when a menu item is selected from drop down
                      setState(() {
                        _currentEyeShape = newValueSelected;
                      });
                    },
                    value: _currentEyeShape,
                  )
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text("Nose Length",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Times new roman",
                          fontSize: 15)),
                  DropdownButton<String>(
                    autofocus: true,
                    items: nose_length.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: "times new roman",
                                fontSize: 15)),
                      );
                    }).toList(),
                    onChanged: (String newValueSelected) {
                      // Your code to execute, when a menu item is selected from drop down
                      setState(() {
                        _currentNoseLength = newValueSelected;
                      });
                    },
                    value: _currentNoseLength,
                  )
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text("Nose Width",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Times new roman",
                          fontSize: 15)),
                  DropdownButton<String>(
                    autofocus: true,
                    items: nose_width.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: "times new roman",
                                fontSize: 15)),
                      );
                    }).toList(),
                    onChanged: (String newValueSelected) {
                      // Your code to execute, when a menu item is selected from drop down
                      setState(() {
                        _currentNoseWidth = newValueSelected;
                      });
                    },
                    value: _currentNoseWidth,
                  )
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text("Nose Type",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Times new roman",
                          fontSize: 15)),
                  DropdownButton<String>(
                    autofocus: true,
                    items: nose_type.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: "times new roman",
                                fontSize: 15)),
                      );
                    }).toList(),
                    onChanged: (String newValueSelected) {
                      // Your code to execute, when a menu item is selected from drop down
                      setState(() {
                        _currentNoseType = newValueSelected;
                      });
                    },
                    value: _currentNoseType,
                  )
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text("Mouth Size",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Times new roman",
                          fontSize: 15)),
                  DropdownButton<String>(
                    items: mouth.map((
                        String dropDownStringItem,
                        ) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Times new roman",
                                fontSize: 15)),
                      );
                    }).toList(),
                    onChanged: (String newValueSelected) {
                      // Your code to execute, when a menu item is selected from drop down
                      setState(() {
                        _currentMouth = newValueSelected;
                      });
                    },
                    value: _currentMouth,
                  )
                ]),
            loading
                ? Center(child: CircularProgressIndicator())
                : FlatButton(
                child: Text("Next",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Calibri",
                        fontSize: 20)),
                color: Colors.blue,
                onPressed: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Home()));
                  }),
          ]
        ),
        )
    );
  }
}
