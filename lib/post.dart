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
              child: Text('Flutter'),
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
              child: Text(
                  'Một tính năng đáng chú ý của nền tảng Dart là hỗ trợ"tải lại nóng"(hot reload) trong đó các sửa đổi trong tập tin nguồn có thể được chèn vào ứng dụng đang chạy. Flutter mở rộng sự hỗ trợ này cho tính năng"tải lại nóng giữ trạng thái (stateful hot reload), để các sửa đổi trong mã nguồn có thể được cập nhật ngay lập tức lên ứng dụng đang chạy mà không cần phải khởi động lại hoặc mất mát các trạng thái đang có.[11] This feature as implemented in Flutter has received widespread praise.'),
            ),
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
              child: Text('Dart'),
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
              child: Text(
                  'Dart là một ngôn ngữ lập trình web do Google phát triển. Nó được chính thức công bố tại Hội thảo GOTO Lưu trữ 2012-12-21 tại Wayback Machine ngày 10-12 tháng 10 năm 2011 tại Aarhus.[1] Mục đích của Dart không phải để thay thế JavaScript như là ngôn ngữ kịch bản chính bên trong trình duyệt web, mà là cung cấp sự lựa chọn hiện đại hơn.[2]'),
            ),
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
              child: Text('Dart'),
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
              child: Text(
                  'React Native là một framework mã nguồn mở được sáng tạo bởi Facebook.[3] Nó được sử dụng để phát triển ứng dụng di động Android[4], iOS, Web[5] và UWP[6] bằng cách cho phép các nhà phát triển sử dụng React cùng với môi trường ứng dụng gốc (native).'),
            ),
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
