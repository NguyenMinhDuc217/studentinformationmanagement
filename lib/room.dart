import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student_information_management/detailpost.dart';
import 'package:student_information_management/menu.dart';
import 'package:student_information_management/model/post.dart';
import 'package:student_information_management/phongctct_hssv/chitietphongctcv_hssv.dart';
import 'package:student_information_management/phongdaotao/chitietphongdaotao.dart';

class RoomPage extends StatefulWidget {
  const RoomPage({Key? key}) : super(key: key);

  @override
  State<RoomPage> createState() => _RoomPageeState();
}

class _RoomPageeState extends State<RoomPage> {
  @override
  Widget build(BuildContext context) {
    Widget _menu = MenuPage();

    return Scaffold(
      backgroundColor: Colors.grey[300],
      drawer: _menu,
      appBar: AppBar(centerTitle: true, title: Text('Phòng CNTT'), actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Quay lại', style: TextStyle(color: Colors.white)))
      ]),
      body: SingleChildScrollView(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 30, bottom: 30),
              decoration: BoxDecoration(
                color: Colors.pink[50],
                border: Border.all(
                  width: 5.0,
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 80,
              width: 500,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChiTietPhongDaoTaoPage()));
                },
                child: Text(
                  "Phòng Đào tạo",
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 30),
              decoration: BoxDecoration(
                color: Colors.pink[50],
                border: Border.all(
                  width: 5.0,
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 80,
              width: 500,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChiTietPhongCTCTHSSVPage()));
                },
                child: Text(
                  "Phòng CTCT - HSSV",
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
