  import 'package:flutter/material.dart';
import 'package:student_information_management/menu.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPagePageState();
}

class _PostPagePageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    Widget _menu = MenuPage();
    Widget _listpost = Container(
      child: Text('Danh sách bài viết', style: TextStyle(fontSize: 20, color: Colors.black)),
    );
    return Scaffold(
      drawer: _menu,
      appBar: AppBar(
        centerTitle: true,
        title: Text('LOGO'),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _listpost,
        ],
      ),
      persistentFooterButtons: [
        Container(
          width: 900,
          child: TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            onPressed: (){},
            child: Text('Thông tin liên lạc', style: TextStyle(color: Colors.blue[900]),),
          ),
        )
      ],
    );
  }
}
