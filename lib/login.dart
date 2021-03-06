import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'data/server.dart';
import 'data/sql.dart';
import 'pages/account.dart';


class Login extends StatefulWidget {
  @override
  _Login createState() => new _Login();
}
class _Login extends State<Login> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  String _email;
  String _password;
  RegExp email = new RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  RegExp password = new RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,50}');


  
  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();
      var data = {'email':_email,'password':_password};
      // Email & password matched our validation rules
      // and are saved to _email and _password fields.
      _performLogin(data);
      
    }
  }

  Future _performLogin(data) async {
    var result = await getData('do-logIn',data);
    var res = json.decode(result);
    if (res[0] == 'Active'){
      // var db = new DatabaseHelper();
      // var query = await db.saveUser(res[2]);
      // print(query);

      scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text('Success!')));
      Navigator.push(context,new MaterialPageRoute(builder: (context) => new Account()));
    }
    else{
      scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text('Failed!')));
    }

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold (
      key: scaffoldKey,
      appBar: new AppBar(
        title: new Text(
            "Login",
            textAlign: TextAlign.center,
          ),
      ),
      body: new ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Form(
              key: formKey,
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Center(
                    child: new Image.asset(
                        'images/icon.png',
                        height: 100.0
                    )
                  ),
                  new Padding(
                    padding: const EdgeInsets.only(left: 40.0,top: 8.0,right: 40.0, bottom: 8.0 ),
                    child: new TextFormField(
                    decoration: new InputDecoration(labelText: 'Your email'),
                    validator: (val) =>
                       !email.hasMatch(val)? 'Invalid email' : null,
                    onSaved: (val) => _email = val,
                    keyboardType: TextInputType.text,
                    ),
                  ),
                  new Padding(
                    padding: const EdgeInsets.only(left: 40.0,top: 8.0,right: 40.0, bottom: 8.0 ),
                    child: new TextFormField(
                    decoration: new InputDecoration(labelText: 'Your password'),
                    validator: (val) =>
                       !password.hasMatch(val)? 'Password is weak' : null,
                    onSaved: (val) => _password = val,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    ),
                  ),
                  new RaisedButton(
                    onPressed: _submit,
                    child: new Text('LOGIN'),
                    color: Colors.teal,
                    textColor: Colors.white,
                    splashColor: Colors.blueGrey,
                  ),
                ],
              ),
            ),
          ],
      )
    );
  }
}