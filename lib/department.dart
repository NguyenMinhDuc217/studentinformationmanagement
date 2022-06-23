import 'package:flutter/material.dart';
import 'package:student_information_management/menu.dart';

class DepartmentPage extends StatefulWidget {
  const DepartmentPage({Key? key}) : super(key: key);

  @override
  State<DepartmentPage> createState() => _DepartmentPageState();
}

class _DepartmentPageState extends State<DepartmentPage> {
  @override
  Widget build(BuildContext context) {
    Widget _menu = MenuPage();
    Widget _post = Container(
      width: 200,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue,
      ),
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 20, bottom: 20),
      child: Text('Khoa CNTT',
          style: TextStyle(fontSize: 20, color: Colors.white)),
    );
    Widget _listpost = Container(
      // margin: EdgeInsets.only(left: 50, right: 50),
      height: 500,
      child: ListView(children: [
        Container(
          margin: EdgeInsets.only(bottom: 20),
          height: 70,
          decoration: BoxDecoration(
            color: Colors.green,
            border: Border.all(
              width: 2.0,
              color: Colors.blue,
            ),
            // borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            title: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: 5),
              child: Container(
                alignment: Alignment.center,
                child: Text('Đồ án tốt nghiệp', style: TextStyle(color: Colors.white, fontSize: 30)),
              ),
            ),
            onTap: () {},
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 20),
          height: 70,
          decoration: BoxDecoration(
            color: Colors.green,
            border: Border.all(
              width: 2.0,
              color: Colors.blue,
            ),
            // borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            title: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: 5),
              child: Container(
                alignment: Alignment.center,
                child: Text('Thực tập tốt nghiệp', style: TextStyle(color: Colors.white, fontSize: 30)),
              ),
            ),
            onTap: () {},
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 20),
          height: 70,
          decoration: BoxDecoration(
            color: Colors.green,
            border: Border.all(
              width: 2.0,
              color: Colors.blue,
            ),
            // borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            title: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: 5),
              child: Container(
                alignment: Alignment.center,
                child: Text('Lịch thi lại', style: TextStyle(color: Colors.white, fontSize: 30)),
              ),
            ),
            onTap: () {},
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 20),
          height: 70,
          decoration: BoxDecoration(
            color: Colors.green,
            border: Border.all(
              width: 2.0,
              color: Colors.blue,
            ),
            // borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            title: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: 5),
              child: Container(
                alignment: Alignment.center,
                child: Text('Câu lạc bộ', style: TextStyle(color: Colors.white, fontSize: 30)),
              ),
            ),
            onTap: () {},
          ),
        ),
      ]));
    return Scaffold(
      backgroundColor: Colors.grey[300],
      drawer: _menu,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Khoa CNTT'),
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
