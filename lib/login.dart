// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:student_information_management/changepassword.dart';
import 'package:student_information_management/errorlogin.dart';
import 'package:student_information_management/homepage.dart';
import 'package:student_information_management/main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _username = "duc@gmail.com";
  String _pass = "duc123";
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();
  var _usererror = "Vụi lòng nhâp Email hợp lệ";
  var _passerror = "Vụi lòng nhâp mật khẩu hợp lệ (trên 5 ký tự)";
  var _usererrorvalid = false;
  var _passerrorvalid = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Scaffold(
          body: SingleChildScrollView(
        child: Container(
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
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                child: TextField(
                  controller: _controller1,
                  style: TextStyle(fontSize: 18, color: Colors.purple),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "Tài Khoản",
                    errorText: _usererrorvalid ? _usererror : null,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    labelStyle: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                child: TextField(
                  controller: _controller2,
                 
                  style: TextStyle(fontSize: 18, color: Colors.black54),
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "Mật khẩu",
                    errorText: _passerrorvalid ? _passerror : null,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    labelStyle: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: RaisedButton(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    onPressed: () {
                      if (!_controller1.text.contains('@gmail.com')) {
                        _usererrorvalid = false;
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => FirstPage()));
                      } else {
                        _usererrorvalid = true;
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const ErrorLoginPage()));
                      }
                      if(_controller2.text.length <5){
                        _passerrorvalid = false;
                      }else{
                        _passerrorvalid = true;
                      }
                      if(_usererrorvalid == true && _passerrorvalid == true){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FirstPage()));
                      }
                      else{
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ErrorLoginPage()));
                      }
                    },
                    child: Text(
                      "Đăng Nhập",
                      style: TextStyle(color: Colors.blue, fontSize: 18),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 20),
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
                              builder: (context) => const Chanepassword()));
                    },
                    child: Text(
                      "Quên mật khẩu",
                      style: TextStyle(color: Colors.blue, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
