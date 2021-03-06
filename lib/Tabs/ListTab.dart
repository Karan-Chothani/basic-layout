import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../SideMenu.dart';

class ListTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: SideMenu(),
      appBar: AppBar(
        title: Text('List'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: new Text(
                "LIST_PAGE",
               // style: Theme.of(context).textTheme.display1,
              ),
            ),
            Container(
              child: new RaisedButton(
                color: Colors.purple,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Back To Home',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
