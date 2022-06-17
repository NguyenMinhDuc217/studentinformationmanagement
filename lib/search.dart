import 'package:flutter/material.dart';
import 'package:student_information_management/menu.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPagePageState();
}

class _SearchPagePageState extends State<SearchPage> {
  final _controller1 = TextEditingController();
  String _bv1 = "Flutter";
  String _bv2 = "Dart";
  String _bv3 = "Visual Studio Code";
  @override
  Widget build(BuildContext context) {
    Widget _menu = MenuPage();
    Widget _notification = Container(
      width: 200,
      height: 30,
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(10),
        // color: Colors.blue,
      ),
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 30, bottom: 20),
      child: TextField(
        controller: _controller1,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Tìm kiếm',
        ),
        onTap: (){},
      ),
    );
    Widget _listnotification = Container(
      margin: EdgeInsets.only(left: 50, right: 50),
      height: 500,
      child: ListView(children: [
        Container(
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
              child: Text(_bv1),
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
                      child: Text('Nội dung tìm kiếm', style: TextStyle(color: Colors.grey)),
                    ),
                    TextButton(
                      onPressed: () {
                        
                      },
                      child:
                          Text('Xem chi tiết', style: TextStyle(color: Colors.blue)),
                    )
                  ],
                )),
            leading: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/murano.jpg'),
            ),
            onTap: () {},
          ),
        ),
        Container(
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
              child: Text(_bv2),
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
                      child: Text('Nội dung tìm kiếm', style: TextStyle(color: Colors.grey)),
                    ),
                    TextButton(
                      onPressed: () {
                        
                      },
                      child:
                          Text('Xem chi tiết', style: TextStyle(color: Colors.blue)),
                    )
                  ],
                )),
            leading: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/venice.jpg'),
            ),
            onTap: () {},
          ),
        ),
        Container(
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
              child: Text(_bv3),
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
                      child: Text('Nội dung tìm kiếm', style: TextStyle(color: Colors.grey)),
                    ),
                    TextButton(
                      onPressed: () {
                        
                      },
                      child:
                          Text('Xem chi tiết', style: TextStyle(color: Colors.blue)),
                    )
                  ],
                )),
            leading: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/paris.jpg'),
            ),
            onTap: () {},
          ),
        ),
      ]),
    );
    return Scaffold(
      drawer: _menu,
      appBar: AppBar(
        centerTitle: true,
        title: Text('LOGO'),
        actions: [
          TextButton(
            onPressed: (){
            Navigator.pop(context);
          }, 
          child: Text('Quay lại', style: TextStyle(color: Colors.white)))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _notification,
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
