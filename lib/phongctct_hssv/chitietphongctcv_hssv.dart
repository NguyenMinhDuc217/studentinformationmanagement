import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student_information_management/detailpost.dart';
import 'package:student_information_management/menu.dart';
import 'package:student_information_management/model/post.dart';
import 'package:student_information_management/phongctct_hssv/detaillichdaotao.dart';

class ChiTietPhongCTCTHSSVPage extends StatefulWidget {
  const ChiTietPhongCTCTHSSVPage({Key? key}) : super(key: key);

  @override
  State<ChiTietPhongCTCTHSSVPage> createState() => _CChiTietPhongCTCTHSSVPageState();
}

class _CChiTietPhongCTCTHSSVPageState extends State<ChiTietPhongCTCTHSSVPage> {
  List<Post> _lstpostldt = [];
  List<Post> _lstpostttn = [];
  List<Post> _lstpostltl = [];
  List<Post> _lstpostclb = [];
  int _countPost = 0;

  FirebaseDatabase database = FirebaseDatabase.instance;
  late DatabaseReference ref;
  late DatabaseReference child;
  late DatabaseEvent event;

  //LỊCH PHÒNG HỌC
  Future<int> countPostLichDaoTao() async {
    ref = FirebaseDatabase.instance.ref("LichDaoTao");
    event = await ref.once();
    setState(() {});
    return event.snapshot.children.length;
  }

  Future<Post> readFirebaseLichDaoTao(int id) async {
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

  //NỘI DUNG SINH HOẠT CHỦ NHIỆM
  Future<int> countPostTTTN() async {
    ref = FirebaseDatabase.instance.ref("ThucTapTotNghiep");
    event = await ref.once();
    setState(() {});
    return event.snapshot.children.length;
  }

  Future<Post> readFirebaseTTTN(int id) async {
    ref = FirebaseDatabase.instance.ref("ThucTapTotNghiep/" + id.toString());
    event = await ref.once();
    dynamic _temp = event.snapshot.value;
    setState(() {});
    return Post(
      _temp["mabaiviet"] as int,
      _temp["anh"] as String,
      _temp["tieude"] as String,
      _temp["noidung"] as String,
      _temp["like"] as int,
      _temp["canseemore"] as bool,
    );
  }

  //ĐĂNG KÝ XÁC NHẬN SINH VIÊN
  Future<int> countPostLTL() async {
    ref = FirebaseDatabase.instance.ref("LichThiLai");
    event = await ref.once();
    setState(() {});
    return event.snapshot.children.length;
  }

  Future<Post> readFirebaseLTL(int id) async {
    ref = FirebaseDatabase.instance.ref("LichThiLai/" + id.toString());
    event = await ref.once();
    dynamic _temp = event.snapshot.value;
    setState(() {});
    return Post(
      _temp["mabaiviet"] as int,
      _temp["anh"] as String,
      _temp["tieude"] as String,
      _temp["noidung"] as String,
      _temp["like"] as int,
      _temp["canseemore"] as bool,
    );
  }

  //THÔNG BÁO KHÁC
  Future<int> countPostCLB() async {
    ref = FirebaseDatabase.instance.ref("CauLacBo");
    event = await ref.once();
    setState(() {});
    return event.snapshot.children.length;
  }

  Future<Post> readFirebaseCLB(int id) async {
    ref = FirebaseDatabase.instance.ref("CauLacBo/" + id.toString());
    event = await ref.once();
    dynamic _temp = event.snapshot.value;
    setState(() {});
    return Post(
      _temp["mabaiviet"] as int,
      _temp["anh"] as String,
      _temp["tieude"] as String,
      _temp["noidung"] as String,
      _temp["like"] as int,
      _temp["canseemore"] as bool,
    );
  }

  @override
  void initState() {
    super.initState();
    this.countPostLichDaoTao().then((value) {
      _countPost = value;
      for (var i = 0; i < _countPost; i++) {
        this.readFirebaseLichDaoTao(i).then((post) {
          _lstpostldt.add(post);
        });
      }
    });
    this.countPostTTTN().then((value) {
      _countPost = value;
      for (var i = 0; i < _countPost; i++) {
        this.readFirebaseTTTN(i).then((post) {
          _lstpostttn.add(post);
        });
      }
    });
    this.countPostLTL().then((value) {
      _countPost = value;
      for (var i = 0; i < _countPost; i++) {
        this.readFirebaseLTL(i).then((post) {
          _lstpostltl.add(post);
        });
      }
    });
    this.countPostCLB().then((value) {
      _countPost = value;
      for (var i = 0; i < _countPost; i++) {
        this.readFirebaseCLB(i).then((post) {
          _lstpostclb.add(post);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget _menu = MenuPage();

    // LỊCH PHÒNG HỌC
    Widget _lichDaoTao = Container(
      margin: EdgeInsets.only(bottom: 5, top: 20),
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
        child: Text('Lịch phòng học',
            style: TextStyle(color: Colors.white, fontSize: 30)),
      ),
    );
    Widget _listLichDaoTao = Container(
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
            itemCount: _lstpostldt.length,
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
                      child: Text(_lstpostldt[index].title.toString(),
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
                                _lstpostldt[index]
                                        .content
                                        .toString()
                                        .substring(0, 50) +
                                    '...',
                                style: TextStyle(color: Colors.black)),
                          ),
                        ],
                      ),
                    ),
                    leading: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(
                          'assets/images/lichdaotao/' + _lstpostldt[index].image.toString()),
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetailLichDaoTaoPage(postId: index,)));
                    },
                  ),
                )),
              );
            }));

    //NỘI DUNG SINH HOẠT CHỦ NHIỆM
    Widget _thucTapTotNghiep = Container(
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
        child: Text('Sinh hoạt chủ nhiệm',
            style: TextStyle(color: Colors.white, fontSize: 30)),
      ),
    );
    Widget _listTTN = Container(
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
            itemCount: _lstpostttn.length,
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
                      child: Text(_lstpostttn[index].title.toString(),
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
                                _lstpostttn[index]
                                        .content
                                        .toString()
                                        .substring(0, 50) +
                                    '...',
                                style: TextStyle(color: Colors.black)),
                          ),
                        ],
                      ),
                    ),
                    leading: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(
                          'assets/images/tttn/' + _lstpostttn[index].image
                            ..toString()),
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPostPage(postId: index)));
                    },
                  ),
                )),
              );
            }));

    //ĐĂNG KÝ XÁC NHẬN SINH VIÊN
    Widget _lichThiLai = Container(
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
        child: Text('Đăng ký xác nhận sinh viên',
            style: TextStyle(color: Colors.white, fontSize: 30)),
      ),
    );
    Widget _listLTT = Container(
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
            itemCount: _lstpostltl.length,
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
                      child: Text(_lstpostltl[index].title.toString(),
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
                                _lstpostltl[index]
                                        .content
                                        .toString()
                                        .substring(0, 50) +
                                    '...',
                                style: TextStyle(color: Colors.black)),
                          ),
                        ],
                      ),
                    ),
                    leading: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/ltl/' +
                          _lstpostltl[index].image.toString()),
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPostPage(postId: index)));
                    },
                  ),
                )),
              );
            }));

    //THÔNG BÁO KHÁC
    Widget _cauLacBo = Container(
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
        child: Text('Thông báo khác',
            style: TextStyle(color: Colors.white, fontSize: 30)),
      ),
    );
    Widget _listCauLacBo = Container(
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
            itemCount: _lstpostclb.length,
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
                      child: Text(_lstpostclb[index].title.toString(),
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
                                _lstpostclb[index]
                                        .content
                                        .toString()
                                        .substring(0, 50) +
                                    '...',
                                style: TextStyle(color: Colors.black)),
                          ),
                        ],
                      ),
                    ),
                    leading: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/clb/' +
                          _lstpostclb[index].image.toString()),
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPostPage(postId: index,)));
                    },
                  ),
                )),
              );
            }));

    return Scaffold(
      backgroundColor: Colors.grey[300],
      drawer: _menu,
      appBar: AppBar(centerTitle: true, title: Text('Phòng đào tạo'), actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Quay lại', style: TextStyle(color: Colors.white)))
      ]),
      body: SingleChildScrollView(
          child: Center(
        child: Column(
          children: [
            //title LỊCH PHÒNG HỌC
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _lichDaoTao,
              ],
            ),
            //data LỊCH PHÒNG HỌC
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _listLichDaoTao,
              ],
            ),

            //title NỘI DUNG SINH HOẠT CHỦ NHIỆM
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _thucTapTotNghiep,
              ],
            ),
            //data NỘI DUNG SINH HOẠT CHỦ NHIỆM
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _listTTN,
              ],
            ),

            //title ĐĂNG KÝ XÁC NHẬN SINH VIÊN
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _lichThiLai,
              ],
            ),
            //data ĐĂNG KÝ XÁC NHẬN SINH VIÊN
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _listLTT,
              ],
            ),

            //title THÔNG BÁO KHÁC
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _cauLacBo,
              ],
            ),
            //data THÔNG BÁO KHÁC
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _listCauLacBo,
              ],
            ),
          ],
        ),
      )),
    );
  }
}
