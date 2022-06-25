// import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student_information_management/detailpost.dart';
import 'package:student_information_management/menu.dart';
import 'package:student_information_management/model/post.dart';
import 'package:student_information_management/detailpost.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPagePageState();
}

class _PostPagePageState extends State<PostPage> {
  List<Post> _lstpost = [];
  List<Post> _lstfindpost = [];
  int _countPost = 0;

FirebaseDatabase database = FirebaseDatabase.instance;
late DatabaseReference ref;
late DatabaseReference child;
late DatabaseEvent event;


  // Fetch content from the json file
  // Future<void> readJson() async {
  //   final String response = await rootBundle.loadString('db/post.json');
  //   final data = await json.decode(response);
  //   setState(() {
  //     _lstpost = data["posts"];
  //     _lstfindpost = _lstpost;
  //   });
  // }

Future<int> countPost() async {
    ref = FirebaseDatabase.instance.ref("BaiViet");
    event = await ref.once();
    setState(() {});
      return event.snapshot.children.length;
  }

  Future<Post> readFirebase(int id) async {
    ref = FirebaseDatabase.instance.ref("BaiViet/"+id.toString());
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
    this.countPost().then((value) {
      _countPost = value;
      for(var i = 0; i < _countPost; i++){
        this.readFirebase(i).then((post) {
          _lstpost.add(post);
          _lstfindpost.add(post);
        });
      }
    });
    
    // this.readJson();
  }

  void find(String _searchPost){
    List<Post> _result = [];
    if(_searchPost.isEmpty || _searchPost == ""){
      _result = _lstpost.toList();
    }else{
      _result = _lstpost.where((post) => post.title.toLowerCase().contains(_searchPost.toLowerCase())).toList();
    }
    setState(() {
      _lstfindpost = _result;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget _search = ListTile(
      title: TextField(
        
        onChanged: (value) => find(value),
        decoration: const InputDecoration(
          labelStyle: TextStyle(
            color:  Colors.red,
          ),
            labelText: 'Search', suffixIcon: Icon(Icons.search, color: Colors.red,)),
      ),
    );
    Widget _post = Container(
      width: 200,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue,
      ),
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 30, bottom: 20),
      child: Text('Danh sách bài viết',
          style: TextStyle(fontSize: 20, color: Colors.white)),
    );
    Widget _listpost = Container(
      margin: EdgeInsets.only(left: 50, top: 30, right: 50),
      height: 500,
      child: ListView.builder(
          itemCount: _lstfindpost.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.only(bottom: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 3.0,
                  color: Colors.blue,
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
                  child: Text(_lstfindpost[index].title),
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
                        child: Text(_lstfindpost[index].canseemore ? _lstfindpost[index].content.toString().substring(0,100) : _lstfindpost[index].content.toString(),
                            style: TextStyle(color: Colors.black)),
                      ),
                      TextButton(
                        onPressed: () {
                          if (_lstfindpost[index].canseemore == true) {
                            _lstfindpost[index].canseemore= false;
                          } else {
                            _lstfindpost[index].canseemore = true;
                          }
                          setState(() {});
                        },
                        child: Text(_lstfindpost[index].canseemore ? 'Xem tiếp' : 'Rút gọn',
                            style: TextStyle(color: Colors.blue)),
                      )
                    ],
                  ),
                ),
                leading: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/'+_lstfindpost[index].image.toString()),
                ),
                onTap: () {
                  // print(_lstfindpost[index]["id"]);
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPostPage(postId: _lstfindpost[index].id.toString())));
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPostPage(postId: index,)));
                },
              ),
            );
          }),
    );
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Column(
          children: [
            _search,
            _listpost,
          ],
        ),
      ),
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
