import 'package:flutter/material.dart';
import 'package:my_app/data/restful_data.dart';
import 'package:my_app/data/dbserver.dart';
// import 'dart:convert';
// import 'dart:async';
// import 'package:http/http.dart' as http;

class Account extends StatefulWidget {
  @override
  _Account createState() => new _Account();
}

class _Account extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new DefaultTabController(
        length: 2,
        child: new Scaffold(
          appBar: new AppBar(
            title: new TabBar(
              tabs: [
                new Tab(child: new Text('Account',style: new TextStyle(fontSize: 20.0))),
                new Tab(child: new Text('Jobs',style: new TextStyle(fontSize: 20.0))),
              ],
            ),
          ),
          body: new TabBarView(
            children: [
              _fetchresult(),
              _accountTab(),
            ],
          ),
        ),
      ),
    );
  }
  Widget _fetchresult(){
    var email = 'Shanna@melissa.tv';
    return new Center(
      child: new FutureBuilder<Post>(
        future: fetchPost(email),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text(
                    snapshot.data.name,
                    style: new TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  new Text(snapshot.data.username,
                    style: new TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                    ),
                  ),
                  new Text(snapshot.data.email,
                    style: new TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                    ),
                  ),
                  new Text(snapshot.data.address,
                    style: new TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                    ),
                  ),
                ]  
              );
          } else if (snapshot.hasError) {
            // return new Text("${snapshot.error}");
             print(snapshot.error);
          }

          // By default, show a loading spinner
          return new CircularProgressIndicator(); 
        },
      )
    );
  }
  Widget _accountTab() {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        new Center(
          child: new Container(
              width: 130.0,
              height: 130.0,
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                border: new Border.all(color: Colors.white30),
              ),
              margin: const EdgeInsets.only(top: 50.0),
              // padding: const EdgeInsets.all(3.0),
              child: new ClipOval(
                  child: new Image.asset('images/icon.png'),
              ),
          ),
        ),
        new Center(
            child: new Text(
            'Jonathan Millet',
            style: new TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
            ),
          )
        ),
      ]
    );
  }
}

