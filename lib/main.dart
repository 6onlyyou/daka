
import 'dart:async';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:daka/pages/ewm.dart';
import 'package:daka/pages/fans_list_page.dart';
import 'package:daka/tools/AlertWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'pages/fans_page.dart';

void main() {
  runApp(MyApp1());
}

class MyApp1 extends StatelessWidget {
  //手势函数声明

  Widget textContainer = Container(
    // 设置上下左右内边距
    padding: EdgeInsets.only(top: 20),
    height: 70,
    // 文本块一定要用'''来引用
    decoration: BoxDecoration(
      color: Color.fromRGBO(196, 236, 255, 1.0),
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
    ),
    child: Center(
      child: Text(
        '我的粉丝',
        style: TextStyle(
          color: Color.fromRGBO(51, 51, 51, 1.0),
          fontSize: 18,
        ),
        textAlign: TextAlign.center,
        softWrap: true,
      ),
    ),
  );


  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Dio请求',
      home: Scaffold(
        body: Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: AssetImage("images/main_bg.png"),
              fit: BoxFit.cover,
              //这里是从assets静态文件中获取的，也可以new NetworkImage(）从网络上获取
            ),
          ),
          child: ListView(
            padding: new EdgeInsets.all(0.0),
            children: <Widget>[
              // 风景图片
              textContainer,
              FansPage(),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 310,
                  child: FansListPage()),
              Manage(),
            ],
          ),
        ),
      ),
    );
  }



}

class Log extends Dialog{

  timer(context)
  {
    print('执行2');
    var time=Timer.periodic(
        Duration(milliseconds: 500),
            (t){
          print('执行3');
          Navigator.pop(context);
          t.cancel();
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    print('执行1');
    timer(context);
    //自定义弹框内容
    return Material(

      type:MaterialType.transparency,
      child: Center(

          child:Container(
            height: 300,
            width: 300,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(20),
                    child: Stack(
                      children: <Widget>[
                        Align(
                          child: Text('提示'),
                          alignment:Alignment.center,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            child: Icon(Icons.confirmation_number),
                            onTap: (){
                              Navigator.pop(context,'guanbi');
                            },
                          ),
                        ),

                      ],
                    )
                ),
                Divider(),
                Container(
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  child: Text('啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊哈哈哈哈哈哈',textAlign: TextAlign.left,),
                )
              ],

            ),
          )
      ),
    );
  }
}
