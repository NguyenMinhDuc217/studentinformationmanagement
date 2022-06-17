import 'dart:io';

import 'package:flutter/material.dart';
import 'package:student_information_management/department.dart';
import 'package:student_information_management/errorlogin.dart';
import 'package:student_information_management/homepage.dart';
import 'package:student_information_management/login.dart';
import 'package:student_information_management/notification.dart';
import 'package:student_information_management/post.dart';
import 'package:student_information_management/start.dart';
import 'package:student_information_management/menu.dart';
import 'package:student_information_management/model/post.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StarPage(),
    );
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int selectedIndex = 0;
  List<Widget> pageList = <Widget>[
    HomePage(),
    PostPage(),
    NotificationPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuPage(),
      appBar: AppBar(
        title: Text('LOGO'),
      ),
      body: pageList[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home Page',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit_location),
            label: 'Posts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit_location_outlined),
            label: 'Notifications',
          ),
        ],
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
      ),
    );
  }
}

