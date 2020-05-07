import 'dart:convert';

import 'package:daka/model/gai_zhang_model.dart';
import 'package:daka/model/user_info_model.dart';
import 'package:daka/service/http_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';
import 'package:barcode_scan/barcode_scan.dart';

import 'Toast.dart';
class Manage extends StatefulWidget {
  final Widget child;

  Manage({Key key, this.child}) : super(key: key);

  _ManageState createState() => _ManageState();
}



class _ManageState extends State<Manage> {
  UserInfoModel usersList = UserInfoModel();
  GaiZhangModel gaiZhangModel = GaiZhangModel();
  Future _scan(BuildContext context) async {
    try {
      ScanResult barcode = await BarcodeScanner.scan();
      print(barcode.rawContent+"内容");
      getFans(barcode.rawContent);
    } on PlatformException catch (e) {
      print(e.toString()+"测试2");
      if (e.code == BarcodeScanner.cameraAccessDenied) {
      } else {
      }
    } on FormatException {
    } catch (e) {
      print("$e测试6");
    }
  }
  Future<void> _askedToLoad(String content) async {
    return showDialog<Null>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: new Text("恭喜"+usersList.data.wechatNickname+"获得"+content, style: new TextStyle(fontSize: 17.0)),
            actions: <Widget>[
            ],
          );
        }
    );
  }
  Future myDialog(context) {
    return showDialog<Null>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return GestureDetector(
          // 手势处理事件
          onTap: () {
            Navigator.of(context).pop(); //退出弹出框
          },
          child: Material(
            type: MaterialType.transparency,
            child: Center(
                child: Container(
                  height: 298,
                  width: 275,
//            padding: EdgeInsets.only(left: 50),
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: AssetImage("images/completebg.9.png"),
                      //这里是从assets静态文件中获取的，也可以new NetworkImage(）从网络上获取
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(top: 50),
                          child: Stack(
                            children: <Widget>[
                              Align(
                                child: Text(
                                  '用户详情',
                                  style: TextStyle(
                                    color: Color.fromRGBO(51, 51, 51, 1.0),
                                    fontSize: 16,
                                  ),
                                ),
                                alignment: Alignment.center,
                              ),
                            ],
                          )),
                      Container(
                        padding: EdgeInsets.only(left: 45),
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 15),
                              width: double.infinity,
                              child: Text(
                                '用户昵称：${usersList.data.wechatNickname==null? "":usersList.data.wechatNickname }',
                                style: TextStyle(
                                  color: Color.fromRGBO(102, 102, 102, 1.0),
                                  fontSize: 15,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              width: double.infinity,
                              child: Text(
                                '${usersList.data.typeSignCount[0].typeName}元打卡次数：${usersList.data.typeSignCount[0].typeSignCount==null?0:usersList.data.typeSignCount[0].typeSignCount}次',
                                style: TextStyle(
                                  color: Color.fromRGBO(102, 102, 102, 1.0),
                                  fontSize: 15,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              width: double.infinity,
                              child: Text(
                                '${usersList.data.typeSignCount[1].typeName}元打卡次数：${usersList.data.typeSignCount[1].typeSignCount==null?0:usersList.data.typeSignCount[1].typeSignCount}次',
                                style: TextStyle(
                                  color: Color.fromRGBO(102, 102, 102, 1.0),
                                  fontSize: 15,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              width: double.infinity,
                              child: Text(
                                '请选择盖章类型?',
                                style: TextStyle(
                                  color: Color.fromRGBO(51, 51, 51, 1.0),
                                  fontSize: 15,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        width: double.infinity,
                        child: Row(
                          children: <Widget>[
                            Container(
                                margin: EdgeInsets.only(left: 30),
                                child:  RaisedButton(
                                  child: new Text("${usersList.data.typeSignCount[0].typeName}元打卡"),
                                  color: Colors.white,

                                  textColor: Color.fromRGBO(29, 168, 239, 1.0),
                                  onPressed: () {
                                    Navigator.of(context).pop(); //退出弹出框
                                    getGsiX(usersList.data.id,usersList.data.typeSignCount[0].typeId);
                                  },
                                  disabledColor: Colors.grey,
                                  disabledTextColor: Colors.white,
                                  disabledElevation: 4,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0) ,side: BorderSide(color: Color.fromRGBO(196, 236, 255, 1.0))), //圆角大小
                                )
                            ),
                            Container(
                                margin: EdgeInsets.only(left: 20),
                                child:  RaisedButton(

                                  child: new Text("${usersList.data.typeSignCount[1].typeName}元打卡"),
                                  color: Colors.white,

                                  textColor: Color.fromRGBO(29, 168, 239, 1.0),
                                  onPressed: () {
                                    Navigator.of(context).pop(); //退出弹出框
                               getGsiX(usersList.data.id,usersList.data.typeSignCount[1].typeId);
                                  },
                                  disabledColor: Colors.grey,
                                  disabledTextColor: Colors.white,
                                  disabledElevation: 4,


//          onPressed: null,// 设置为null即为不可点击（disabled）状态
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0) ,side: BorderSide(color: Color.fromRGBO(196, 236, 255, 1.0))), //圆角大小
                                )
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        );
      },
    );

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('Jsonsss格式:::ssss' );
  }
  void getGsiX(int userAccount,int typeId) async {
    // 请求url
    var url = 'http://www.konkonyu.com/appservice/wechat/qrcode/seal';
    // 请求参数：店铺Id
    var formData = {'merchantAccount': '9','merchantPassword': 'fushuaige...','userAccount': userAccount,'typeId': typeId};

    // 调用请求方法传入url及表单数据
    await request(url, formData: formData).then((value) {
      // 返回数据进行Json解码
      var data = json.decode(value.toString());
      // 打印数据
      print('商品列表数据Json格式:::' + data.toString());

      // 设置状态刷新数据
      setState(() {
        // 将返回的Json数据转换成Model
        var fansListModel = new GaiZhangModel();
        gaiZhangModel = fansListModel.fromJson(data);
        if(gaiZhangModel.data=="盖章成功"){
          Toast.toast(context,msg: "打卡成功",position: ToastPostion.bottom);
        }else{
          _askedToLoad(gaiZhangModel.data);
        }

      });
    });
  }

  void getFans(String url1) async {
    // 请求url
    var url = url1;
    // 请求参数：店铺Id
//    var formData = {'merchantId': '9'};
    // 调用请求方法传入url及表单数据
    await requestHead(url).then((value) {
      // 返回数据进行Json解码
      var data = json.decode(value.toString());
      // 打印数据
      print('Jsonsss格式:::' + data.toString());

      // 设置状态刷新数据
      setState(() {
        // 将返回的Json数据转换成Model
        var fansListModel = new UserInfoModel();
        usersList = fansListModel.fromJson(data);
        myDialog(context);
      });
    });
  }
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

              _scan(context);
            },
            child: buttonContainer));
  }
}
