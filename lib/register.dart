import 'package:flutter/material.dart';
import 'package:validator/validator.dart';
//import 'package:my_app/homeScreen.dart';

class Register extends StatefulWidget {
  @override
  _Register createState() => new _Register();
}
class _Register extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold (
        appBar: new AppBar(
          title: new Text(
            "Register",
            textAlign: TextAlign.center,
          ),
        ),
        body: new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Form(
                  child: new Column(
                    children: <Widget>[
                      new Padding(
                        padding: const EdgeInsets.only(left: 30.0,top: 8.0,right: 30.0, bottom: 8.0 ),
                        child: new TextFormField(
                          decoration: new InputDecoration(labelText: "First Name"),
                        ),
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(left: 30.0,top: 8.0,right: 30.0, bottom: 8.0 ),
                        child: new TextFormField(
                          decoration: new InputDecoration(labelText: "Last Name"),
                        ),
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(left: 30.0,top: 8.0,right: 30.0, bottom: 8.0 ),
                        child: new TextFormField(
                          decoration: new InputDecoration(labelText: "Date of Birth"),
                        ),
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(left: 30.0,top: 8.0,right: 30.0, bottom: 8.0 ),
                        child: new TextFormField(
                          validator: (val) {
                            return isEmail(val)
                                ? "Invalid email"
                                : null;
                          },
//                      builder: (val){
//                        return new TextField(
//                          onChanged: (val) {
//                            return isEmail(val)
//                                ? "Invalid email"
//                                : null;
//                          },
                          decoration: new InputDecoration(labelText: "Email"),
//                        );
//                      },

                        ),
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(left: 30.0,top: 8.0,right: 30.0, bottom: 8.0 ),
                        child: new TextFormField(
                          decoration: new InputDecoration(labelText: "Password"),
                        ),
                      ),
                    ],
                  ),
                ),
                new RaisedButton(
                  onPressed: null,
                  child: new Text('REGISTER'),
                  color: Colors.deepPurple,
                  textColor: Colors.white,
                  splashColor: Colors.blueGrey,
                ),
              ],
            )
        )
    );
  }
}