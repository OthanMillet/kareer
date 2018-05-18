import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import '../data/server.dart';
import '../data/sql.dart';
import '../tinderswipe/cards_section_alignment.dart';
import '../tinderswipe/cards_section_draggable.dart';

class Account extends StatefulWidget {
  @override
  _Account createState() => new _Account();
}

class _Account extends State<Account> {
  bool showAlignmentCards = false;
  final db = new DatabaseHelper();
  
  Future getData() async{
    var user = await db.getData('User');
    var account = await getAccount('get-account',{'email':user[0]['email'],'id':user[0]['id'],'auth':""});
    return json.decode(account.data)[0];
  }
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new DefaultTabController(
        length: 2,
        child: new Scaffold(
          appBar: new AppBar(
            backgroundColor: Colors.teal,
            elevation: 0.0,
            title: new TabBar(
              indicatorWeight: 1.0,
              indicatorColor: Colors.transparent,
              tabs: [
                new Tab(child: new Text('Account',style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,))),
                new Tab(child: new Text('Jobs',style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,))),
              ],
            ),
          ),
          body: new TabBarView(
            children: [
              _accountTab(),
              _swipeJobs()
            ],
          ),
        ),
      ),
    );
  }
  Widget _accountTab() {
    getData();
    return new ListView(
      // mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        new Center(
          child: new Container(
              width: 110.0,
              height: 110.0,
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
            'Juan Dela Cruz',
            style: new TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
            ),
          )
        ),
        new Divider(
          height: 15.0,
        ),
        new Padding(
            padding: const EdgeInsets.only(left: 20.0,top: 5.0,right: 20.0, bottom: 5.0),
            child: new Text('Industry',
                style: new TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 17.0,
                )
            ),
        ),
        new Card(
          margin: const EdgeInsets.only(left: 15.0,top: 10.0,right: 15.0, bottom: 10.0),
          child: new Padding(
            padding: const EdgeInsets.only(left: 20.0,top: 20.0,right: 20.0, bottom: 20.0),
            child: new Text('No Information to show.',
              style: new TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                )
            )
          ),
        ),
        new Padding(
            padding: const EdgeInsets.only(left: 20.0,top: 5.0,right: 20.0, bottom: 5.0),
            child: new Text('Skills',
                style: new TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 17.0,
                )
            ),
        ),
        new Card(
          margin: const EdgeInsets.only(left: 15.0,top: 10.0,right: 15.0, bottom: 10.0),
          child: new Padding(
            padding: const EdgeInsets.only(left: 20.0,top: 20.0,right: 20.0, bottom: 20.0),
            child: new Text('No Information to show.',
              style: new TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                )
            )
          ),
        ),
        new Padding(
            padding: const EdgeInsets.only(left: 20.0,top: 5.0,right: 20.0, bottom: 5.0),
            child: new Text('Personal Information',
                style: new TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 17.0,
                )
            ),
        ),
        new Card(
          margin: const EdgeInsets.only(left: 15.0,top: 10.0,right: 15.0, bottom: 10.0),
          child: new Padding(
            padding: const EdgeInsets.only(left: 20.0,top: 20.0,right: 20.0, bottom: 20.0),
            child: new Text('No Information to show.',
              style: new TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                )
            )
          ),
        ),
        new Padding(
            padding: const EdgeInsets.only(left: 20.0,top: 5.0,right: 20.0, bottom: 5.0),
            child: new Text('Academic Information',
                style: new TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 17.0,
                )
            ),
        ),
        new Card(
          margin: const EdgeInsets.only(left: 15.0,top: 10.0,right: 15.0, bottom: 10.0),
          child: new Padding(
            padding: const EdgeInsets.only(left: 20.0,top: 20.0,right: 20.0, bottom: 20.0),
            child: new Text('No Information to show.',
              style: new TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                )
            )
          ),
        ),
        new Padding(
            padding: const EdgeInsets.only(left: 20.0,top: 5.0,right: 20.0, bottom: 5.0),
            child: new Text('Career Information',
                style: new TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 17.0,
                )
            ),
        ),
        new Card(
          margin: const EdgeInsets.only(left: 15.0,top: 10.0,right: 15.0, bottom: 10.0),
          child: new Padding(
            padding: const EdgeInsets.only(left: 20.0,top: 20.0,right: 20.0, bottom: 20.0),
            child: new Text('No Information to show.',
              style: new TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                )
            )
          ),
        ),
      ]
    );
  }
  
  Widget _swipeJobs(){
    return new Column
      (
        children: <Widget>
        [
          showAlignmentCards ? new CardsSectionAlignment(context) : new CardsSectionDraggable(),
          buttonsRow()
        ],
      );
  }
  Widget buttonsRow(){
    return new Container
    (
      margin: new EdgeInsets.symmetric(vertical: 48.0),
      child: new Row
      (
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>
        [
          new FloatingActionButton
          (
            mini: true,
            onPressed: () {},
            backgroundColor: Colors.white,
            child: new Icon(Icons.close, color: Colors.blue),
          ),
          new Padding(padding: new EdgeInsets.only(right: 8.0)),
          new FloatingActionButton
          (
            onPressed: () {},
            backgroundColor: Colors.white,
            child: new Icon(Icons.bookmark, color: Colors.teal),
          ),
          new Padding(padding: new EdgeInsets.only(right: 8.0)),
          // new FloatingActionButton
          // (
          //   onPressed: () {},
          //   backgroundColor: Colors.white,
          //   child: new Icon(Icons.favorite, color: Colors.green),
          // ),
          // new Padding(padding: new EdgeInsets.only(right: 8.0)),
          new FloatingActionButton
          (
            mini: true,
            onPressed: () {},
            backgroundColor: Colors.white,
            child: new Icon(Icons.check, color: Colors.red),
          ),
        ],
      ),
    );
  }

}