
import 'dart:async';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:daka/pages/ewm.dart';
import 'package:daka/pages/fans_list_page.dart';
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
  Widget buttonContainer = Container(
    // 设置上下左右内边距

    margin: EdgeInsets.only(top: 30),
    padding: EdgeInsets.only(bottom: 10),
    width: 90,
    height: 90,
    decoration: BoxDecoration(
      image: new DecorationImage(
        image: AssetImage("images/gaiz.png"),
        //这里是从assets静态文件中获取的，也可以new NetworkImage(）从网络上获取
      ),
    ),

      child: Center(
        child: Text(
          '扫码盖章',
          style: TextStyle(
            color: Color.fromRGBO(255, 255, 255, 1.0),
            fontSize: 14,
          ),
          textAlign: TextAlign.center,
          softWrap: true,
        ),
      ),
  );

  @override
  Widget build(BuildContext context) {
    // 风景区介绍文本部分
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
              Container(
                  child: GestureDetector(
                      onTap: () {
                        print('click-OK');
                        show(context);
//                        _scan(context);
//                        Navigator.push(context,
//                            MaterialPageRoute(builder: (context) => ewMPage()));
                      },
                      child: buttonContainer)),
            ],
          ),
        ),
      ),
    );
  }
  Future myDialog(context){
    return showDialog<Null>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return GestureDetector(							// 手势处理事件


            onTap: (){
              Navigator.of(context).pop();				//退出弹出框
            },


            child: Container(								//弹出框的具体事件
              child: Material(
                color: Color.fromRGBO(0, 0, 0, 0.5),
                child: Center(
                  child: Text('具体操作',style: TextStyle(color: Colors.white),),
                ),
              ),
            )
        );

      },
    );
  }
  show(BuildContext context)
  {
//    ScreenUtil.init(context);
//
////If the design is based on the size of the iPhone6 ​​(iPhone6 ​​750*1334)
//    ScreenUtil.init(context, width: 750, height: 1334);
//
////If you want to set the font size is scaled according to the system's "font size" assist option
//    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: true);
    print('执行6');
    //Future类型,then或者await获取
    showDialog(
      // 传入 context
        context: context,
        // 构建 Dialog 的视图
        builder: (_) => Stack(
          children: <Widget>[
            Positioned(
//              left: ScreenUtil.screenWidth / 10,
//              top: ScreenUtil.screenWidth / 10 * 3,
//              child: Image.asset(
//                'assets/images/updatereminder_icon_bg@3x.png',
//                width: ScreenUtil.screenWidth / 10 * 8,
//              ),
            ),
            Positioned(
//              left: ScreenUtil.screenWidth / 10,
//              top: ScreenUtil.screenWidth / 10 * 3,
              child: Container(
                padding: EdgeInsets.only(top: 30, left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '${'发现新版本'}',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          decoration: TextDecoration.none),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 3),
                      child: Text(
                        '大蘇打',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            decoration: TextDecoration.none),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
//                left: ScreenUtil.screenWidth / 10 + 20,
//                top: ScreenUtil.screenWidth / 10 * 3 + 180,
                child: Container(
                  child: Text(
                    '大蘇打撒',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0XFF333333),
                        decoration: TextDecoration.none),
                  ),
                )),
            Positioned(
              child: GestureDetector(
                child: Image.asset('assets/images/updatereminder_icon_close@3x.png',width: 25,),
                onTap: (){
                  Navigator.pop(_);
                },
              ),
              ),
          ],
        )
    );
  }
  Future _scan(BuildContext context) async {
    try {
      String barcode = (await BarcodeScanner.scan()) as String;
//      setState(() {
//        return this.barcode = barcode;
//      });
      print(barcode+"sjdadhaksd");
      myDialog(context);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.cameraAccessDenied) {
//        setState(() {
//          return this.barcode = 'The user did not grant the camera permission!';
//        });
      } else {
//        setState(() {
//          return this.barcode = 'Unknown error: $e';
//        });
      }
    } on FormatException {
//      setState(() => this.barcode =
//      'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
//      setState(() => this.barcode = 'Unknown error: $e');
    }
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
