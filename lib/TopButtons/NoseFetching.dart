

import 'dart:convert';



import 'package:shared_preferences/shared_preferences.dart';


import 'package:flutter/material.dart';




class NoseFetch extends StatelessWidget {



  // This widget is the root of your application.
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
      home: MyHomePage(),
    );
  }


}

class MyHomePage extends StatefulWidget {


  @override
  _DataFetching createState() => _DataFetching();
}

class _DataFetching extends State<MyHomePage>{
  SharedPreferences pref;
  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((prefs) {
      setState(() => pref = prefs);
    });
  }
  List<String> nose_data;



  @override
  Widget build(BuildContext context) {

    return  Scaffold(
        appBar: AppBar(

          title: Text("fetch"),
        ),
        body: Center(
            child: Column(

            )));

  }


  }



