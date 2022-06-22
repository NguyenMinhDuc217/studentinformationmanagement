// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'dart:math';

import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student_information_management/detailpost.dart';
import 'package:student_information_management/menu.dart';
import 'package:student_information_management/model/post.dart';
import 'package:student_information_management/notification.dart';
import 'package:student_information_management/post.dart';
import 'package:student_information_management/search.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _post = [];
  List _postnew = [];
  List _notifications = [];
  int maxlikepost = 0;
  int maxlikenotification = 0;
  var dateTime = "";

  
  // var date = new DateTime.now();
  // var dt = DateFormat("dd-MM-yyyy").format(date);


  // Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('db/post.json');
    final data = await json.decode(response);
    setState(() {
      //post
      _post = data["posts"];
      for (var i = 0; i < _post.length; i++) {
        if (int.parse(_post[maxlikepost]["like"]) <= int.parse(_post[i]["like"])) {
          maxlikepost = i;
        }
      }
      //notification
      _notifications = data["notifications"];
      for (var j = 0; j < _notifications.length; j++) {
        if (int.parse(_notifications[maxlikepost]["like"]) <= int.parse(_notifications[j]["like"])) {
          maxlikepost = j;
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    this.readJson();
  }

  @override
  Widget build(BuildContext context) {
    Widget _slide = ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(_post.length, (i) {
          return GestureDetector(
            onTap: () {},
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset(
                      'assets/images/'+_post[i]['image'].toString(),
                      width: 200,
                      height: 300,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Positioned(
                    left: 30.0,
                    bottom: 25.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(_post[i]['title'].toString(),
                            style:
                                TextStyle(fontSize: 18, color: Colors.white)),
                      ],
                    )),
                Positioned(
                    top: 10,
                    right: 10,
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.share,
                          color: Colors.white,
                        )))
              ],
            ),
          );
        }));
    Widget _newPostList = Container(
      margin: EdgeInsets.only(bottom: 5),
      width: 200,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(
          width: 5.0,
          color: Colors.blueGrey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        alignment: Alignment.center,
        child: Text('New post list', style: TextStyle(color: Colors.white, fontSize: 30)),
      ),
    );
    Widget _listnew = Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 5.0,
          color: Colors.yellow,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(10),
      width: 350,
      height: 300,
      child: ListView.builder(
        // shrinkWrap: true,
        itemCount: _post.length,
        itemBuilder: (BuildContext context, int index){
          return Container(
            child: GestureDetector(
              // onTap: () {
              //   Navigator.push(
              //       context, MaterialPageRoute(builder: (context) => SearchPage()));
              // },
              child: Container(
                // color: Colors.white,
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                    border: Border.all(
                    width: 2.0,
                    // color: Colors.blue,
                    ),
                    borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                title: Container(
                  margin: EdgeInsets.only(bottom: 5),
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                      color: Colors.blue,
                      width: 2,
                    )),
                  ),
                  // child: Text(_post[maxlikepost]["title"]),
                  child: Text(DateTime.parse("2022-06-20 22:37:54.789757").toString(), style: TextStyle(color: Colors.red)),
                  // child: Text('abc'),
                ),
                subtitle: Container(
                  padding: EdgeInsets.only(left: 5),
                  decoration: BoxDecoration(
                    border: Border(
                        left: BorderSide(
                      color: Colors.grey,
                      width: 1,
                    )),
                  ),
                  child: Row(
                    children: [
                      Flexible(
                        child: Text( _post[maxlikepost]['content'].toString().substring(0,100),
                            style: TextStyle(color: Colors.black)),
                      ),
                    ],
                  ),
                ),
                leading: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/'+_post[maxlikepost]['image'].toString()),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPostPage()));
                },
              ),
              )
            ),
          );
        })
    );
    Widget _notification = Container(
      margin: EdgeInsets.only(top: 30),
      decoration: BoxDecoration(
        color: Colors.blue[300],
        border: Border.all(
          width: 5.0,
          color: Colors.blue,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(10),
      width: 300,
      height: 100,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SearchPage()));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(_notifications[maxlikenotification]["title"],
                style: TextStyle(color: Colors.black)),
            Text(_notifications[maxlikenotification]["content"].toString().substring(0, 100) + '...',
                style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              height: 200,
              child: _slide,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _newPostList,
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _listnew,
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _notification,
              ],
            ),
          ],
        ),
      )
      // persistentFooterButtons: [
      //   Container(
      //     width: 900,
      //     child: TextButton(
      //       style: ButtonStyle(
      //         foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
      //       ),
      //       onPressed: () {},
      //       child: Text(
      //         'Thông tin liên lạc',
      //         style: TextStyle(color: Colors.blue[900]),
      //       ),
      //     ),
      //   )
      // ],
    );
  }
}
