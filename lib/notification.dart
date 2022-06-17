import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student_information_management/menu.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPagePageState();
}

class _NotificationPagePageState extends State<NotificationPage> {
  List _lstnotification = [];
  List _lstfindnotification = [];

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('db/post.json');
    final data = await json.decode(response);
    setState(() {
      _lstnotification = data["notifications"];
      _lstfindnotification = _lstnotification;
    });
  }

  @override
  void initState() {
    super.initState();
    this.readJson();
  }

  void find(String _searchPost) {
    List _result = [];
    if (_searchPost.isEmpty || _searchPost == "") {
      _result = _lstnotification.toList();
      print(_result);
    } else {
      _result = _lstnotification
          .where((notification) => notification["title"]
              .toLowerCase()
              .contains(_searchPost.toLowerCase()))
          .toList();
    }
    setState(() {
      _lstfindnotification = _result;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget _search = ListTile(
      title: TextField(
        onChanged: (value) => find(value),
        decoration: const InputDecoration(
            labelText: 'Search', suffixIcon: Icon(Icons.search)),
      ),
    );
    Widget _notification = Container(
      width: 200,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue,
      ),
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 30, bottom: 20),
      child: Text('Thông báo',
          style: TextStyle(fontSize: 20, color: Colors.white)),
    );
    Widget _listnotification = Container(
        margin: EdgeInsets.only(left: 50, top: 30, right: 50),
        height: 500,
        child: ListView.builder(
          itemCount: _lstfindnotification.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.only(bottom: 30),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2.0,
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
                  child: Text(_lstfindnotification[index]['title'].toString()),
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
                            _lstfindnotification[index]['canseemore']
                                ? _lstfindnotification[index]['content']
                                    .toString()
                                    .substring(0, 100)
                                : _lstfindnotification[index]['content']
                                    .toString(),
                            style: TextStyle(color: Colors.grey)),
                      ),
                      TextButton(
                        onPressed: () {
                          if (_lstfindnotification[index]['canseemore'] ==
                              true) {
                            _lstfindnotification[index]['canseemore'] = false;
                          } else {
                            _lstfindnotification[index]['canseemore'] = true;
                          }
                          setState(() {});
                        },
                        child: Text(
                            _lstfindnotification[index]['canseemore']? 'Xem tiếp' : 'Rút gọn',
                            style: TextStyle(color: Colors.blue)),
                      )
                    ],
                  ),
                ),
                leading: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/'+_lstfindnotification[index]['image'].toString()),
                ),
                onTap: () {},
              ),
            );
          },
        ));
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _search,
            _listnotification,
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
