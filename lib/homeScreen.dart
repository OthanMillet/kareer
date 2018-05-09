import 'package:flutter/material.dart';
import 'package:my_app/login.dart';
import 'package:my_app/register.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold (
      body: new Container(
          child: new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Image.asset(
                'images/kareer_colored_logo.png',
                height: 110.0
                ),
                new Padding(
                  padding: new EdgeInsets.all(8.0),
                  child: new RaisedButton(
                      child: new Text('Login'),
                      color: Colors.teal,
                      textColor: Colors.white,
                      splashColor: Colors.blueGrey,
                      onPressed: () {
                        Navigator.push(
                          context,
                          new MaterialPageRoute(builder: (context) => new Login()),
                        );
                      }
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.all(8.0),
                   child: new RaisedButton(
                       child: new Text('Register'),
                       color: Colors.deepPurple,
                       textColor: Colors.white,
                       splashColor: Colors.blueGrey,
                       onPressed: () {
                         Navigator.push(
                           context,
                           new MaterialPageRoute(builder: (context) => new Register()),
                         );
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

