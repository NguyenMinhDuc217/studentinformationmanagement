import 'package:flutter/material.dart';
import 'package:student_information_management/homepage.dart';
import 'package:student_information_management/login.dart';
import 'package:student_information_management/notification.dart';
import 'package:student_information_management/post.dart';


void main() {
  runApp(const MyApp());
}

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
      home: NotificationPage(),
    );
  }
}