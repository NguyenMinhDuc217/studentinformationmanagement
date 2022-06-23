import 'package:flutter/material.dart';
import 'package:student_information_management/department.dart';
import 'package:student_information_management/homepage.dart';
import 'package:student_information_management/login.dart';
import 'package:student_information_management/notification.dart';
import 'package:student_information_management/post.dart';
import 'package:student_information_management/profile.dart';
import 'package:student_information_management/search.dart';
import 'package:student_information_management/setting.dart';

import './mode_toggle_button.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPagePageState();
}

class _MenuPagePageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    Widget _menu = Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/murano.jpg'),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                ModeToggleButton(),
              ],
            )
          ),
          SizedBox(
            width: double.infinity,
            //height: 40,
            child: RaisedButton(
              color: Colors.blue[400],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MainPages()));
              },
              child: Text(
                "Xem trang cá nhân",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ),
          ListTile(
            title: const Text('Khoa Công Nghệ Thông Tin'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DepartmentPage()));
            },
          ),
          ListTile(
            title: const Text('Phòng'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Đoàn thanh niên'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Học bổng - Vay vốn'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Học phí'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Cài đặt'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingPage()));
            },
          ),
          ListTile(
            title: const Text('Đăng xuất'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
          ),
        ],
      ),
    );
    Widget _listpost = Container(
      child: Text('Danh sách bài viết',
          style: TextStyle(fontSize: 20, color: Colors.black)),
    );
    return _menu;
  }
}
