import 'package:daka/pages/fans_list_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dio请求',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dio请求'),
        ),

//这块和上面不一样之前是 home: Scaffold里的 Scaffold被放到类里面现在是body里的说明只需要主界面需要动态变化
        body: Scrollbar(
          child: Center(
            child: FansListPage(),
          ),
        ),
      ),
    );
  }
}
