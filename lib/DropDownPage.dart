import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:firebasetogrid/Home.dart';
import 'package:firebasetogrid/face_part.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'dart:ui';
import 'package:shared_preferences/shared_preferences.dart';


class DropDownPage extends StatefulWidget {
  @override
  _DropDownPageState createState() => _DropDownPageState();
}

class _DropDownPageState extends State<DropDownPage> {
  SharedPreferences prefs;
  List<String> mouth_str = List<String>();
  List<String> eye_str = List<String>();
  List<String> nose_str = List<String>();
  var loading = false;
  List<String> forehead = ["big", "small", "medium"];
  List<String> eyes = ["big", "small", "medium"];
  List<String> nose = ["big", "small", "medium"];
  List<String> mouth = ["big", "small", "medium"];
  List<String> facetype = ["round", "diamond", "square", "triangle", "rectangle", "Oblong"];
  var _currentForeheadSelected;
  var _currentFaceSelected;
  var _currentEyesSelected;
  var _currentNoseSelected;
  var _currentMouthSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Select Feature"),
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
              Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text("ForeHead Type",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Times new roman",
                          fontSize: 15)),
                  DropdownButton<String>(
                    autofocus: true,
                    items: forehead.map((String dropDownStringItem) {
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
                        _currentForeheadSelected = newValueSelected;
                      });
                    },
                    value: _currentForeheadSelected,
                  )
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text("Face Type",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Times new roman",
                          fontSize: 15)),
                  DropdownButton<String>(
                    autofocus: true,
                    items: facetype.map((String dropDownStringItem) {
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
                        _currentFaceSelected = newValueSelected;
                      });
                    },
                    value: _currentFaceSelected,
                  )
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text("Eyes type",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Times new roman",
                          fontSize: 15)),
                  DropdownButton<String>(
                    items: eyes.map((
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
                        _currentEyesSelected = newValueSelected;
                      });
                    },
                    value: _currentEyesSelected,
                  )
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text("Nose type",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Times new roman",
                          fontSize: 15)),
                  DropdownButton<String>(
                    items: nose.map((String dropDownStringItem) {
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
                        _currentNoseSelected = newValueSelected;
                      });
                    },
                    value: _currentNoseSelected,
                  )
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text("Mouth type",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Times new roman",
                          fontSize: 15)),
                  DropdownButton<String>(
                    items: mouth.map((String dropDownStringItem) {
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
                        _currentMouthSelected = newValueSelected;
                      });
                    },
                    value: _currentMouthSelected,
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
                  await _onDropDownItemSelected();
                  eye_str.clear();
                  nose_str.clear();
                  mouth_str.clear();

                  Future<List<facial>> elist = facial.alleyes();
                  List<facial> alleyes = new List<facial>();

                  elist.then((value) async {
                    for (var item in value) {
                      alleyes.add(new facial(
                          criminal_id: item.criminal_id,
                          part_size: item.part_size,
                          link: item.link));
                      Uint8List bytes =
                      (await NetworkAssetBundle(Uri.parse(item.link))
                          .load(item.link))
                          .buffer
                          .asUint8List();
                      eye_str.add(base64.encode(bytes));
                      print(bytes);
                    }

                    prefs.setStringList("eye_list", eye_str);
                  });
                  Future<List<facial>> nlist = facial.allnose();
                  List<facial> allnose = new List<facial>();

                  nlist.then((value) async {
                    for (var item in value) {
                      allnose.add(new facial(
                          criminal_id: item.criminal_id,
                          part_size: item.part_size,
                          link: item.link));
                      Uint8List bytes =
                      (await NetworkAssetBundle(Uri.parse(item.link))
                          .load(item.link))
                          .buffer
                          .asUint8List();
                      nose_str.add(base64.encode(bytes));
                    }

                    prefs.setStringList("nose_list", nose_str);
                  });
                  Future<List<facial>> mlist = facial.allmouth();
                  List<facial> allmouth = new List<facial>();
                  mlist.then((value) async {
                    for (var item in value) {
                      allmouth.add(new facial(
                          criminal_id: item.criminal_id,
                          part_size: item.part_size,
                          link: item.link));
                      Uint8List bytes =
                      (await NetworkAssetBundle(Uri.parse(item.link))
                          .load(item.link))
                          .buffer
                          .asUint8List();
                      mouth_str.add(base64.encode(bytes));
                    }

                    prefs.setStringList("mouth_list", mouth_str);
                  });

                  setState(() {
                    loading = false;
                  });

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Home()));
                })
          ]),
        ));
    // This trailing comma makes auto-formatting nicer for build methods.
  }

  Future<Uint8List> _onDropDownItemSelected() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      loading = true;
      prefs.setString("eyes", _currentEyesSelected);

      prefs.setString("nose", _currentNoseSelected);

      prefs.setString("mouth", _currentMouthSelected);

      prefs.setString("facetype", _currentFaceSelected);

      prefs.setString("forehead", _currentForeheadSelected);
    });
  }
}
