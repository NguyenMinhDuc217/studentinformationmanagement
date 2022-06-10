  import 'package:flutter/material.dart';
import 'package:student_information_management/notification.dart';
import 'package:student_information_management/post.dart';

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
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('MENU'),
          ),
          ListTile(
            title: const Text('Danh sách bài viết'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => PostPage()));
            },
          ),
          ListTile(
            title: const Text('Thông báo'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationPage()));
            },
          ),
          ListTile(
            title: const Text('Khoa'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Phòng'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Cài đặt'),
            onTap: () {},
          ),
        ],
      ),
    );
    Widget _listpost = Container(
      child: Text('Danh sách bài viết', style: TextStyle(fontSize: 20, color: Colors.black)),
    );
    return _menu;
  }
}
