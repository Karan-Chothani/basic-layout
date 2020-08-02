
import 'package:firebasetogrid/Home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'DropDownPage.dart';

void main() {
  runApp(new MaterialApp(
    home: App(),
  ));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DropDownPage(),
    );
  }
}
