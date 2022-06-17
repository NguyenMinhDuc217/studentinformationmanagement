import 'package:flutter/material.dart';
import 'package:student_information_management/changepassword.dart';
import 'package:student_information_management/homepage.dart';

class ErrorLoginPage extends StatefulWidget {
  const ErrorLoginPage({Key? key}) : super(key: key);
  @override
  _ErrorLoginPageState createState() => _ErrorLoginPageState();
}

class _ErrorLoginPageState extends State<ErrorLoginPage> {
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
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                child: TextField(
                  style: TextStyle(fontSize: 18, color: Colors.purple),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "Tài Khoản",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    labelStyle: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                child: TextField(
                  style: TextStyle(fontSize: 18, color: Colors.black54),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "Mật khẩu",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    labelStyle: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Text('Tài khoản hoặc mật khẩu không đúng',
                    style: TextStyle(fontSize: 18, color: Colors.red)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 10),
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
                      "Đăng Nhập",
                      style: TextStyle(color: Colors.blue, fontSize: 18),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 10),
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
      ),
    );
  }
}
