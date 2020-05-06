

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Manage extends StatefulWidget {
  final Widget child;
  Manage({Key key, this.child}) : super(key: key);

  _ManageState createState() => _ManageState();
}
//show(BuildContext context)
//{
//
//  print('执行6');
//  //Future类型,then或者await获取
//  showDialog(
//    // 传入 context
//      context: context,
//      // 构建 Dialog 的视图
//      builder: (_) => Stack(
//        children: <Widget>[
//          Positioned(
//              left: ScreenUtil.screenWidth / 10,
//              top: ScreenUtil.screenWidth / 10 * 3,
//            child: Container(
//              padding: EdgeInsets.only(top: 30, left: 20),
//              child: Column(
//                mainAxisAlignment: MainAxisAlignment.start,
//                crossAxisAlignment: CrossAxisAlignment.start,
//                children: <Widget>[
//                  Text(
//                    '${'发现新版本'}',
//                    style: TextStyle(
//                        fontSize: 20,
//                        fontWeight: FontWeight.bold,
//                        color: Colors.white,
//                        decoration: TextDecoration.none),
//                  ),
//                  Container(
//                    padding: EdgeInsets.only(left: 3),
//                    child: Text(
//                      '大蘇打',
//                      style: TextStyle(
//                          fontSize: 14,
//                          color: Colors.white,
//                          decoration: TextDecoration.none),
//                    ),
//                  ),
//                ],
//              ),
//            ),
//          ),
//          Positioned(
//                left: ScreenUtil.screenWidth / 10 + 20,
//                top: ScreenUtil.screenWidth / 10 * 3 + 180,
//              child: Container(
//                child: Text(
//                  '大蘇打撒',
//                  style: TextStyle(
//                      fontSize: 14,
//                      fontWeight: FontWeight.w400,
//                      color: Color(0XFF333333),
//                      decoration: TextDecoration.none),
//                ),
//              )),
//        ],
//      )
//  );
//}
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
class _ManageState extends State<Manage> {
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
  _ManageState();
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

//If the design is based on the size of the iPhone6 ​​(iPhone6 ​​750*1334)
    ScreenUtil.init(context, width: 750, height: 1334);

//If you want to set the font size is scaled according to the system's "font size" assist option
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: true);
   return Container(
        child: GestureDetector(
            onTap: () {
              print('click-OK');
              myDialog(context);
//                        _scan(context);
//                        Navigator.push(context,
//                            MaterialPageRoute(builder: (context) => ewMPage()));
            },
            child: buttonContainer));
  }
}