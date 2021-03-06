
import 'dart:async';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:daka/pages/ewm.dart';
import 'package:daka/pages/fans_list_page.dart';
import 'package:daka/pages/login_page.dart';
import 'package:daka/tools/AlertWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'fans_page.dart';
class HomePage extends StatelessWidget {
  //手势函数声明
  var hommepassword = "";
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
//    super.build(context);
    ScreenUtil.init(context, width: 375, height: 812, allowFontScaling: false);
//    ScreenUtil.init(context);
//    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    return  Scaffold(

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
                  margin: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
                  height: ScreenUtil().setHeight(440),
                  child: FansListPage()),
              Manage(),
            ],
          ),
        ),
      );

  }



}