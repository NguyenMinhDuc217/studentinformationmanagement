// import 'dart:async';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student_information_management/menu.dart';

class DetailPostPage extends StatefulWidget {
  const DetailPostPage({Key? key}) : super(key: key);
  // const DetailPostPage({Key? key, required this.postId}) : super(key: key);
  // final String postId;

  @override
  State<DetailPostPage> createState() => _DetailPostPageState();
}

class _DetailPostPageState extends State<DetailPostPage> {
  // List _lstpost = [];
  // int _idpost = 0;
  // Fetch content from the json file
  // Future<void> readJson() async {
  // //  String _postId = widget.postId ;
  //   final String response = await rootBundle.loadString('db/post.json');
  //   final data = await json.decode(response);
  //   setState(() {
  //     print(widget.postId);
  //     _lstpost = data["posts"];
  //       // for (var i = 0; i < _lstpost.length; i++) {
  //       //   if (int.parse(data["posts"][i]["id"]) == int.parse(_postId)){
  //       //     _idpost = i;
  //       //   }

  //       // }
  //   });
  // }

  List _lstpost = [];
  List _lstfindpost = [];
  bool _icon=true;
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

  @override
  void initState() {
    super.initState();
    this.readJson();
  }

  @override
  Widget build(BuildContext context) {
    Widget _detailPost = Container(
        child: Column(
      children: [
        Container(
            margin: EdgeInsets.only(left: 50, top: 30, right: 50),
            height: 80,
            child: ListTile(
              leading: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/murano.jpg'),
              ),
              title: Text('Flutter',
                  style: TextStyle(
                      fontSize: 50,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold)),
            )),
        Container(
          margin: EdgeInsets.only(left: 50, top: 30, right: 50),
          child: Column(
            children: <Widget>[
              // Flexible(
              //   child: Text(
              //     // _lstfindpost[0]['canseemore']? _lstfindpost[0]['content'].toString().substring(0, 100): _lstfindpost[0]['content'].toString(),
              //     // _lstfindpost[0]['canseemore']? 'Ngắn': 'Dài',
              //     'abc',
              //       style: TextStyle(color: Colors.grey, fontSize: 20)),
              // ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2.0,
                    color: Colors.blue,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Text(
                      _lstfindpost[0]['canseemore']
                          ? _lstfindpost[0]['content'].toString().substring(0, 100)
                          : _lstfindpost[0]['content'].toString(),
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                    TextButton(
                      onPressed: () {
                        if (_lstfindpost[0]['canseemore'] == true) {
                          _lstfindpost[0]['canseemore'] = false;
                        } else {
                          _lstfindpost[0]['canseemore'] = true;
                        }
                        setState(() {});
                      },
                      child: Text(
                          _lstfindpost[0]['canseemore'] ? 'Xem tiếp' : 'Rút gọn',
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
                color: Colors.blue,
                width: 2,
            ))
          ),
          child: Row(
            children: [
              // Container(
              //    decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(45),
              //       color: Colors.blue,
              //       border: Border.all(width: 2),
              //    ),
              //   child: Icon(Icons.thumb_up, color: Colors.white,),
              // ),
              Text(yourlike+( like.toString())+orderlike,style: TextStyle(color: Colors.black)),
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
                      if(_icon == true){
                        like++;
                        yourlike = 'Bạn';
                        orderlike = 'và người khác.';
                        _icon=false;
                      }else{
                        like--;
                        yourlike = ' ';
                        orderlike = '';
                        _icon=true;
                      }
                      setState(() {});
                    },
                    icon: _icon?Icon(Icons.thumb_up_alt_outlined, color: Colors.blue):Icon(Icons.thumb_up_alt_rounded,color: Colors.blue),
                    // icon: Icon(Icons.thumb_up_alt_outlined, color: Colors.blue),
                  )
              )
            ],
          ),
        )
      ],
    ));
    return Scaffold(
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
          ],
        ),
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
