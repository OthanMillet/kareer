import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _Register createState() => new _Register();
}
class _Register extends State<Register> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();
  final _padding = const EdgeInsets.only(left: 40.0,top: 8.0,right: 40.0, bottom: 8.0 );

  String _firstname;
  String _lastname;
  String _email;
  String _password;
  RegExp email = new RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  RegExp password = new RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,50}');
  
  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();
      var data = {'firstname':_firstname, 'lastname':_lastname, 'email': _email, 'password': _password};

      // Email & password matched our validation rules
      // and are saved to _email and _password fields.
      _performRegister(data);
    }
  }

  void _performRegister(data) {
    print(data);
    // var jsonData = new Insert.fromJson(data);
    // print(jsonData);
    // This is just a demo, so no actual login here.
    final snackbar = new SnackBar(
      content: new Text('Success!'),
    );

    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold ( 
        key: scaffoldKey,
        appBar: new AppBar(
          title: new Text(
            "Register",
            textAlign: TextAlign.center,
          ),
        ),
        body: new ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Form(
              key: formKey,
              child: new Column( 
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Center(
                    child: new Image.asset(
                        'images/icon.png',
                        height: 100.0
                    )
                  ),
                  new Padding(
                    padding: _padding,
                    child: new TextFormField(
                      decoration: new InputDecoration(labelText: "First Name"),
                      onSaved: (val) => _firstname = val,
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  new Padding(
                    padding: _padding,
                    child: new TextFormField(
                      decoration: new InputDecoration(labelText: "Last Name"),
                      onSaved: (val) => _lastname = val,
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  new Padding(
                    padding: _padding,
                    child: new TextFormField(
                    decoration: new InputDecoration(labelText: 'Your email'),
                    validator: (val) =>
                      !email.hasMatch(val)? 'Invalid email' : null,
                    onSaved: (val) => _email = val,
                    keyboardType: TextInputType.text,
                    ),
                  ),
                  new Padding(
                    padding: _padding,
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
                    child: new Text('REGISTER'),
                    color: Colors.deepPurple,
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