import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Home.dart';


void main() {
  runApp(new MaterialApp(
    home: App(),
  ));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}
