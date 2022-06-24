// import 'dart:async';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student_information_management/menu.dart';
import 'package:student_information_management/model/post.dart';

class DetailLichDaoTaoPage extends StatefulWidget {
  // const DetailPostPage({Key? key}) : super(key: key);
  const DetailLichDaoTaoPage({Key? key, required this.postId}) : super(key: key);
  final int postId;

  @override
  State<DetailLichDaoTaoPage> createState() => _DetailLichDaoTaoPageState();
}

class _DetailLichDaoTaoPageState extends State<DetailLichDaoTaoPage> {
  List<Post> _lstpost = [];
  List<Post> _lstfindpost = [];
  int _countPost = 0;
  final _inputComment = TextEditingController();

  FirebaseDatabase database = FirebaseDatabase.instance;
  late DatabaseReference ref;
  late DatabaseReference child;
  late DatabaseEvent event;

  Future<Post> readFirebase(int id) async {
    ref = FirebaseDatabase.instance.ref("LichDaoTao/" + id.toString());
    event = await ref.once();
    dynamic _temp = event.snapshot.value;
    setState(() {});
    return Post(
      _temp["mabaiviet"] as int,
      _temp["anh"] as String,
      _temp["tieude"] as String,
      _temp["noidung"] as String,
      _temp["like"] as int,
      _temp['canseemore'] as bool,
    );
  }

  @override
  void initState() {
    super.initState();
    readFirebase(widget.postId).then((post) {
      _lstpost.add(post);
      _lstfindpost.add(post);
    });

    // this.readJson();
  }

  // List _lstpost = [];
  // List _lstfindpost = [];
  bool _icon = true;
  int like = 10;
  String yourlike = ' ';
  String orderlike = ' ';

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('db/post.json');
    final data = await json.decode(response);
    setState(() {
      _lstpost = data["posts"];
      _lstfindpost = _lstpost;
    });
  }

  // @override
  // void initState() {
  //   super.initState();
  //   readJson();
  // }

  @override
  Widget build(BuildContext context) {
    Widget _detailPost = Container(
      decoration: BoxDecoration(
          color: Colors.pink[50],
          border: Border.all(
            width: 5.0,
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
      children: [
        Container(
            margin: EdgeInsets.only(left: 50, top: 30, right: 50),
            height: 120,
            child: ListTile(
              leading: CircleAvatar(
                radius: 50,
                backgroundImage:
                    AssetImage('assets/images/lichdaotao/' + _lstpost[0].image.toString()),
              ),
              title: Text(_lstpost[0].title,
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold)),
            )),
        Container(
          margin: EdgeInsets.only(left: 50, top: 30, right: 50),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                color: Colors.white,
                  border: Border.all(
                    width: 2.0,
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Text(
                      _lstpost[0].canseemore
                          ? _lstpost[0].content.toString().substring(0, 100)
                          : _lstpost[0].content.toString(),
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    TextButton(
                      onPressed: () {
                        if (_lstpost[0].canseemore == true) {
                          _lstpost[0].canseemore = false;
                        } else {
                          _lstpost[0].canseemore = true;
                        }
                        setState(() {});
                      },
                      child: Text(
                          _lstpost[0].canseemore ? 'Xem tiếp' : 'Rút gọn',
                          style: TextStyle(color: Colors.blue, fontSize: 15)),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 50, right: 50),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
            color: Colors.white,
            width: 2,
          ))),
          child: Row(
            children: [
              Text(yourlike + (like.toString()) + orderlike,
                  style: TextStyle(color: Colors.black)),
            ],
          ),
        ),
        Container(
          child: Row(
            children: [
              Expanded(
                  child: IconButton(
                onPressed: () {
                  _icon != _icon;
                  if (_icon == true) {
                    like++;
                    yourlike = 'Bạn';
                    orderlike = 'và người khác.';
                    _icon = false;
                  } else {
                    like--;
                    yourlike = ' ';
                    orderlike = '';
                    _icon = true;
                  }
                  setState(() {});
                },
                icon: _icon
                    ? Icon(Icons.thumb_up_alt_outlined, color: Colors.blue[800])
                    : Icon(Icons.thumb_up_alt_rounded, color: Colors.blue[800]),
              ))
            ],
          ),
        ),
      ],
    ));
    Widget _comment = Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 5.0,
          color: Colors.yellow,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      width: 300,
      child: TextField(
        controller: _inputComment,
        style: TextStyle(fontSize: 18, color: Colors.black54),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          labelText: "Nhập bình luận",
          border:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          labelStyle: TextStyle(color: Colors.grey, fontSize: 15),
        ),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.grey[300],
      drawer: MenuPage(),
      appBar: AppBar(
        title: Text('NEWS'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Quay lại', style: TextStyle(color: Colors.white)))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _detailPost,
            _comment,
          ],
        ),
      ),
    );
  }
}
