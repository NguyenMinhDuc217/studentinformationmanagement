import 'dart:io';

import 'package:flutter/material.dart';

import 'package:student_information_management/login.dart';
import 'package:student_information_management/homepage.dart';

class StarPage extends StatefulWidget {
  const StarPage({Key? key}) : super(key: key);
  @override
  _StarPageState createState() => _StarPageState();
}

class _StarPageState extends State<StarPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.fromLTRB(30, 0, 30, 40),
          //constraints: BoxConstraints.expand(),
          color: Colors.blue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 100),
                child: Container(
                  width: 1200,
                  height: 200,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      //shape: BoxShape.circle,
                      //color: Colors.grey,
                      ),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('images/logo.jpg'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 40),
                child: SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: RaisedButton(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Text(
                      "Đăng nhập",
                      style: TextStyle(color: Colors.blue, fontSize: 18),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 40),
                child: SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: RaisedButton(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()));
                    },
                    child: Text(
                      "Đăng ký",
                      style: TextStyle(color: Colors.blue, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
