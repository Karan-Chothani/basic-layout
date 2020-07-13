import 'package:flutter/material.dart';

class PrintIndex extends StatefulWidget {
  int index;
  PrintIndex({this.index});
  @override
  _PrintIndex createState() => _PrintIndex(index);
}

class _PrintIndex extends State<PrintIndex> {
  int index;
  _PrintIndex(this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firegrid demo'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Text("$index"),
    );
  }
}
