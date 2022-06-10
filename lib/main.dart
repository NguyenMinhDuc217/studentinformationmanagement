import 'dart:io';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(home: LoginPage());
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String result = "";
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passlController = new TextEditingController();
  var _emailErr = "Chưa nhập thông tin ";
  var _PassErr = "Chưa nhập thông tin";
  var _emailInvalid = false;
  var _PassInvalid = false;

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
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
              //   child: TextField(
              //     style: TextStyle(fontSize: 18, color: Colors.purple),
              //     controller: _emailController,
              //     decoration: InputDecoration(
              //       filled: true,
              //       fillColor: Colors.white,
              //       labelText: "Tài Khoản",
              //       border: OutlineInputBorder(
              //           borderSide: BorderSide(color: Colors.black)),
              //       errorText: _emailInvalid ? _emailErr : null,
              //       labelStyle: TextStyle(color: Colors.grey, fontSize: 15),
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
              //   child: TextField(
              //     style: TextStyle(fontSize: 18, color: Colors.black54),
              //     controller: _passlController,
              //     decoration: InputDecoration(
              //       filled: true,
              //       fillColor: Colors.white,
              //       labelText: "Mật khẩu",
              //       border: OutlineInputBorder(
              //           borderSide: BorderSide(color: Colors.black)),
              //       errorText: _PassInvalid ? _PassErr : null,
              //       labelStyle: TextStyle(color: Colors.grey, fontSize: 15),
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: RaisedButton(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    onPressed: () {},
                    child: Text(
                      "Đăng Nhập",
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
                      exit(0);
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
