// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student_information_management/menu.dart';
import 'package:student_information_management/model/post.dart';
import 'package:student_information_management/notification.dart';
import 'package:student_information_management/post.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    List _post = [];
    late Post posttrending;
    int maxlike = 0;

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('db/post.json');
    final data = await json.decode(response);
    setState(() {
      _post = data["posts"];
      for(var i = 0; i<_post.length;i++){
        if(int.parse(_post[maxlike]["like"]) <= int.parse(_post[i]["like"])){
          maxlike = i;
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
        children: List.generate(3, (i) {
          return GestureDetector(
            onTap: () {},
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset(
                      'assets/images/newyork.jpg',
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
                        Text('Bài viết ' + (i + 1).toString(),
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
    Widget _new = Container(
      decoration: new BoxDecoration(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(_post[maxlike]["title"], style: TextStyle(color: Colors.black)),
          Text(_post[maxlike]["content"].toString().substring(0,100) + '...', style: TextStyle(color: Colors.white)),
        ],
      ),
    );
    Widget _notification = Container(
      margin: EdgeInsets.only(top: 30),
      decoration: new BoxDecoration(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Thông báo nổi bật', style: TextStyle(color: Colors.black)),
          Text('Nội dung', style: TextStyle(color: Colors.white)),
        ],
      ),
    );
    return Scaffold(
      body: Column(
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
              _new,
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
      persistentFooterButtons: [
        Container(
          width: 900,
          child: TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            onPressed: () {},
            child: Text(
              'Thông tin liên lạc',
              style: TextStyle(color: Colors.blue[900]),
            ),
          ),
        )
      ],
    );
  }
}
