// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student_information_management/detailpost.dart';
import 'package:student_information_management/menu.dart';
import 'package:student_information_management/model/post.dart';
import 'package:student_information_management/notification.dart';
import 'package:student_information_management/post.dart';
import 'package:student_information_management/search.dart';
import 'package:firebase_core/firebase_core.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _post = [];
  List _postnew = [];
  List _postTrending = [];
  int maxlikepost = 0;
  var dateTime = "";
  // var date = new DateTime.now();
  // var dt = DateFormat("dd-MM-yyyy").format(date);

  int _countPost = 0;
  List<Post> _lstpost = [];
  List<Post> _lstPostTrending = [];
  List<Post> _lstposttemp = [];

  FirebaseDatabase database = FirebaseDatabase.instance;
  late DatabaseReference ref;
  late DatabaseReference child;
  late DatabaseEvent event;

  Future<int> countPost() async {
    ref = FirebaseDatabase.instance.ref("BaiViet");
    event = await ref.once();
    setState(() {});
    return event.snapshot.children.length;
  }

  Future<Post> readFirebasePost(int id) async {
    ref = FirebaseDatabase.instance.ref("BaiViet/" + id.toString());
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
    countPost().then((value) {
      _countPost = value;
      for (var i = 0; i < _countPost; i++) {
        readFirebasePost(i).then((post) {
          _lstpost.add(post);
          _lstPostTrending.add(post);
          // _lstposttemp.add(post);
        });
      };
        // _lstPostTrending = _lstposttemp;
      // print(_lstpost.length);
      //   for (var j = 0; j < _lstPostTrending.length - 1; j++){
      //     for (var k = j + 1; k < _lstPostTrending.length; k++) {
      //       if (_lstPostTrending[j].like < _lstPostTrending[k].like) {
      //         dynamic _temp = _lstPostTrending[j];
      //         _lstPostTrending[j] = _lstPostTrending[k];
      //         _lstPostTrending[k] = _temp;
      //       }
      //     }
      //   }
    });
    // countPost().then((value) {
    //   _countPost = value;
    //   for (var i = 0; i < _countPost; i++) {
    //     readFirebasePost(i).then((post) {
    //       // _lstpost.add(post);
    //       _lstposttemp.add(post);
    //       _lstPostTrending = _lstposttemp;
    //     });
    //     for (var j = 0; j < _lstPostTrending.length - 1; j++){
    //       for (var k = j + 1; k < _lstPostTrending.length; k++) {
    //         if (_lstPostTrending[j].like < _lstPostTrending[k].like) {
    //           dynamic _temp = _lstPostTrending[j];
    //           _lstPostTrending[j] = _lstPostTrending[k];
    //           _lstPostTrending[k] = _temp;
    //         }
    //       }
    //     }
    //     print(_lstPostTrending);
    //   };
    // });
    this.readJson();
  }

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('db/post.json');
    final data = await json.decode(response);
    setState(() {
      //post
      _post = data["posts"];
      for (var i = 0; i < _post.length; i++) {
        if (int.parse(_post[maxlikepost]["like"]) <=
            int.parse(_post[i]["like"])) {
          maxlikepost = i;
        }
      }
      //post trending
      _post = data["posts"];
      _postTrending = _post;
      for (var j = 0; j < _postTrending.length - 1; j++) {
        for (var k = j + 1; k < _postTrending.length; k++) {
          if (int.parse(_postTrending[j]["like"]) <
              int.parse(_postTrending[k]["like"])) {
            dynamic _temp = _postTrending[j];
            _postTrending[j] = _postTrending[k];
            _postTrending[k] = _temp;
          }
        }
      }
    });
  }

  // @override
  // void initState() {
  //   super.initState();
  //   readJson();
  // }

  @override
  Widget build(BuildContext context) {
    Widget _slide = ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(_lstpost.length, (i) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPostPage(postId: i,)));
            },
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset(
                      'assets/images/' + _lstpost[i].image.toString(),
                      width: 200,
                      height: 300,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Positioned(
                    left: 30.0,
                    bottom: 25.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(_lstpost[i].title.toString(),
                            style:
                                TextStyle(fontSize: 18, color: Colors.white)),
                      ],
                    )),
                Positioned(
                  top: 10,
                  right: 10,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.share,
                      color: Colors.white,
                    )
                  )
                )
              ],
            ),
          );
        }));

    Widget _titlePostList = Container(
      margin: EdgeInsets.only(bottom: 5),
      width: 200,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(
          width: 5.0,
          color: Colors.blueGrey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        alignment: Alignment.center,
        child: Text('New post list',
            style: TextStyle(color: Colors.white, fontSize: 30)),
      ),
    );

    Widget _listnew = Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 5.0,
            color: Colors.yellow,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(10),
        width: 350,
        height: 300,
        child: ListView.builder(
            // shrinkWrap: true,
            itemCount: _post.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: GestureDetector(
                    child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    border: Border.all(
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: Container(
                      margin: EdgeInsets.only(bottom: 5),
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                          color: Colors.blue,
                          width: 2,
                        )),
                      ),
                      // child: Text(_post[maxlikepost]["title"]),
                      child: Text(
                          DateTime.parse("2022-06-20 22:37:54.789757")
                              .toString(),
                          style: TextStyle(color: Colors.red)),
                    ),
                    subtitle: Container(
                      padding: EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                        border: Border(
                            left: BorderSide(
                          color: Colors.grey,
                          width: 1,
                        )),
                      ),
                      child: Row(
                        children: [
                          Flexible(
                            child: Text(
                                _post[maxlikepost]['content']
                                    .toString()
                                    .substring(0, 100),
                                style: TextStyle(color: Colors.black)),
                          ),
                        ],
                      ),
                    ),
                    leading: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/' +
                          _post[maxlikepost]['image'].toString()),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailPostPage(postId: index,)));
                    },
                  ),
                )),
              );
            }));

    Widget _titleMostPopularPostList = Container(
      margin: EdgeInsets.only(bottom: 5, top: 30),
      width: 300,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(
          width: 5.0,
          color: Colors.blueGrey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        alignment: Alignment.center,
        child: Text('List of most popular',
            style: TextStyle(color: Colors.white, fontSize: 30)),
      ),
    );

    Widget _listMostPopularPost = Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 5.0,
            color: Colors.yellow,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(10),
        width: 350,
        height: 300,
        child: ListView.builder(
            // shrinkWrap: true,
            itemCount: _post.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: GestureDetector(
                    child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    border: Border.all(
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: Container(
                      margin: EdgeInsets.only(bottom: 5),
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                          color: Colors.blue,
                          width: 2,
                        )),
                      ),
                      // child: Text(_post[maxlikepost]["title"]),
                      child: Text('abc', style: TextStyle(color: Colors.red)),
                    ),
                    subtitle: Container(
                      padding: EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                        border: Border(
                            left: BorderSide(
                          color: Colors.grey,
                          width: 1,
                        )),
                      ),
                      child: Row(
                        children: [
                          Flexible(
                            child: Text(
                                _post[maxlikepost]['content']
                                        .toString()
                                        .substring(0, 100) +
                                    '...',
                                style: TextStyle(color: Colors.black)),
                          ),
                        ],
                      ),
                    ),
                    leading: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/' +
                          _post[maxlikepost]['image'].toString()),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailPostPage(postId: index,)));
                    },
                  ),
                )),
              );
            }));

    Widget _titlePostListTrending = Container(
      margin: EdgeInsets.only(bottom: 5, top: 30),
      width: 300,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(
          width: 5.0,
          color: Colors.blueGrey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        alignment: Alignment.center,
        child: Text('List of post trending',
            style: TextStyle(color: Colors.white, fontSize: 30)),
      ),
    );

    Widget _listPostTrending = Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 5.0,
            color: Colors.yellow,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(10),
        width: 350,
        height: 300,
        child: ListView.builder(
            // shrinkWrap: true,
            itemCount: _lstPostTrending.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: GestureDetector(
                    child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    border: Border.all(
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: Container(
                      margin: EdgeInsets.only(bottom: 5),
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                          color: Colors.blue,
                          width: 2,
                        )),
                      ),
                      child: Text(_lstPostTrending[index].title.toString(),
                          style: TextStyle(color: Colors.red)),
                    ),
                    subtitle: Container(
                      padding: EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                        border: Border(
                            left: BorderSide(
                          color: Colors.grey,
                          width: 1,
                        )),
                      ),
                      child: Row(
                        children: [
                          Flexible(
                            child: Text(
                                _lstPostTrending[index].content
                                        .toString()
                                        .substring(0, 100) +
                                    '...',
                                style: TextStyle(color: Colors.black)),
                          ),
                        ],
                      ),
                    ),
                    leading: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/' +
                          _lstPostTrending[index].image.toString()),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailPostPage(postId: index,)));
                    },
                  ),
                )),
              );
            }));

    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //slider
              Container(
                padding: EdgeInsets.all(10),
                height: 200,
                child: _slide,
              ),
              //title new post list
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _titlePostList,
                ],
              ),
              //new post list
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _listnew,
                ],
              ),
              //title most popular post list
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _titleMostPopularPostList,
                ],
              ),
              //most popular post list
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _listMostPopularPost,
                ],
              ),
              //title post list trending
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _titlePostListTrending,
                ],
              ),
              //post list trending
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _listPostTrending,
                ],
              ),
            ],
          ),
        )
        // persistentFooterButtons: [
        //   Container(
        //     width: 900,
        //     child: TextButton(
        //       style: ButtonStyle(
        //         foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
        //       ),
        //       onPressed: () {},
        //       child: Text(
        //         'Thông tin liên lạc',
        //         style: TextStyle(color: Colors.blue[900]),
        //       ),
        //     ),
        //   )
        // ],
        );
  }
}
