import 'package:flutter/material.dart';
// import 'package:validator/validator.dart';
//import 'package:my_app/homeScreen.dart';

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

      // Email & password matched our validation rules
      // and are saved to _email and _password fields.
      _performLogin();
    }
  }

  void _performLogin() {
    // This is just a demo, so no actual login here.
    final snackbar = new SnackBar(
      content: new Text('Email: $_email, password: $_password'),
    );

    scaffoldKey.currentState.showSnackBar(snackbar);
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
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Form(
              key: formKey,
              child: new ListView(
                scrollDirection: Axis.horizontal,
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
                ],
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
        )
      )
    );
  }
}