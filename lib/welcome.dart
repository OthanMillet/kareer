import 'package:flutter/material.dart';
class Welcome extends StatefulWidget {
  @override
  _Welcome createState() => new _Welcome();
}

class _Welcome extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold (
      body: new Container(
          child: new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Center(
                    child: new Text(
                    'Welcome',
                    style: new TextStyle(
                      color: Colors.teal,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ),
                  )
                ),
                new Image.asset(
                'images/kareer_colored_logo.png',
                height: 110.0
                ),
                new Padding(
                  padding: new EdgeInsets.all(8.0),
                   child: new RaisedButton(
                       child: new Text('Getting Started'),
                       color: Colors.teal,
                       textColor: Colors.white,
                       splashColor: Colors.blueGrey.shade50,
                       onPressed: () {
                       }
                   )
                )
              ]
            )
          )
      ),
    );
  }
}

