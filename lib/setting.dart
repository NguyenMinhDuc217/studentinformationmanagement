import 'package:flutter/material.dart';
import 'package:student_information_management/menu.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    Widget _menu = MenuPage();
    Widget _post = Container(
      width: 200,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue,
      ),
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 30, bottom: 20),
      child: Text('Cài đặt',
          style: TextStyle(fontSize: 20, color: Colors.white)),
    );
    Widget _listpost = Container(
      margin: EdgeInsets.only(left: 50, right: 50),
      height: 500,
      child: ListView(children: [
        Container(
          margin: EdgeInsets.only(bottom: 10),
          height: 40,
          decoration: BoxDecoration(
            color: Colors.blue[200],
            border: Border.all(
              width: 2.0,
              color: Colors.blue,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            title: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: 5),
              child: Text('Thông tin cá nhân', style: TextStyle(color: Colors.white)),
            ),
            onTap: () {},
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 10),
          height: 40,
          decoration: BoxDecoration(
            color: Colors.blue[200],
            border: Border.all(
              width: 2.0,
              color: Colors.blue,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            title: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: 5),
              child: Text('Mật khẩu', style: TextStyle(color: Colors.white)),
            ),
            onTap: () {},
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 10),
          height: 40,
          decoration: BoxDecoration(
            color: Colors.blue[200],
            border: Border.all(
              width: 2.0,
              color: Colors.blue,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            title: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: 5),
              child: Text('Thông báo', style: TextStyle(color: Colors.white)),
            ),
            onTap: () {},
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 10),
          height: 40,
          decoration: BoxDecoration(
            color: Colors.blue[200],
            border: Border.all(
              width: 2.0,
              color: Colors.blue,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            title: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: 5),
              child: Text('Tìm kiếm', style: TextStyle(color: Colors.white)),
            ),
            onTap: () {},
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 10),
          height: 40,
          decoration: BoxDecoration(
            color: Colors.blue[200],
            border: Border.all(
              width: 2.0,
              color: Colors.blue,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            title: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: 5),
              child: Text('Đăng xuất', style: TextStyle(color: Colors.white)),
            ),
            onTap: () {},
          ),
        ),
      ]
      ),   
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
        ]
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _post,
            _listpost,
          ],
        ),
      ),
      // body: Center(
      //   child: Column(
      //     children: [
      //       _post,
      //       _listpost,
      //     ],
      //   ),
      // ),
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
