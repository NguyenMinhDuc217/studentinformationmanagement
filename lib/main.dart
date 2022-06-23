// ignore_for_file: unused_import

import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import './providers/theme_provider.dart';

import './mode_toggle_button.dart';

import 'package:student_information_management/department.dart';
import 'package:student_information_management/errorlogin.dart';
import 'package:student_information_management/homepage.dart';
import 'package:student_information_management/login.dart';
import 'package:student_information_management/notification.dart';
import 'package:student_information_management/post.dart';
import 'package:student_information_management/search.dart';
import 'package:student_information_management/start.dart';
import 'package:student_information_management/menu.dart';
import 'package:student_information_management/model/post.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
 runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
        return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ThemeProvider(),
        ),
        //Your other providers goes here...
      ],
      child: Consumer<ThemeProvider>(
        builder: (ctx, themeObject, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Dynamic Theme Demo',
          themeMode: themeObject.mode,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            primaryColor: Colors.blue[600],
            accentColor: Colors.amber[700],
            brightness: Brightness.light,
            backgroundColor: Colors.grey[100],
            fontFamily: 'Karla',
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          darkTheme: ThemeData(
            primarySwatch: Colors.blue,
            primaryColor: Colors.blue[300],
            accentColor: Colors.amber,
            brightness: Brightness.dark,
            backgroundColor: Colors.grey[900],
            fontFamily: 'Karla',
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: FirstPage(),
        ),
      ),
    );
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   debugShowCheckedModeBanner: false,
    //   home: FirstPage(),
    // );
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
        title: Text('NEWS'),
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
