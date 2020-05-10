
import 'dart:convert';

import 'package:daka/model/fans_data_model.dart';
import 'package:daka/service/http_service.dart';
import 'package:daka/tools/UserLoggedInEvent.dart';
import 'package:flutter/material.dart';

import '../main.dart';
class FansPage extends StatefulWidget {
  @override
  _FansPageState createState() => _FansPageState();
}

class _FansPageState extends State<FansPage> {
  FansDataModel fansList = FansDataModel();
  // 动画控制器
  AnimationController controller;
  // 补间对象
  Animation animation;
  var username = "";
  var password = "";
  @override
  void initState() {
    super.initState();
    // 获取商品数据
    var future = get();

    future.then((value) {
      setState(() {
        print("111");
        username = value;
      });
    });
    var future1 = getpass();
    future1.then((value) {
      setState(() {
        print("111pass");
        password = value;
        _listen();
        getData();
      });
    });

  }
  void _listen(){
    eventBus.on<UserLoggedInEvent>().listen((event){
      if(event.text=="200"){
        setState(() {
          print("222");
          getData();
        });
      }
    });
  }
  void getData() async {
    // 请求url
    var url = 'http://www.konkonyu.com/appservice/wechat/qrcode/getFans';
    // 请求参数：店铺Id
    var formData = {'merchantId':username};
    print('urld地址:::' + url.toString());
    // 调用请求方法传入url及表单数据
    await request(url, formData: formData).then((value) {
      // 返回数据进行Json解码
      var data = json.decode(value.toString());
      // 打印数据
      print('Json格式:::' + data.toString());
      print('id是fans:::' + username);
      print('id是fans:::' + password);
      // 设置状态刷新数据
      setState(() {
        // 将返回的Json数据转换成Model
        var fansDataModel = new FansDataModel();
        fansList = fansDataModel.fromJson(data);
      });
    });
  }
  @override
  Widget build(BuildContext context) {

      return Container(
        padding: const EdgeInsets.all(16.0),
        height: 60,
        margin: const EdgeInsets.fromLTRB(16, 10.0, 16, 0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
//          border: Border(
//            left: BorderSide(width: 1.0, color: Colors.black12),
//            top: BorderSide(width: 1.0, color: Colors.black12),
//            right: BorderSide(width: 1.0, color: Colors.black12),
//            bottom: BorderSide(width: 1.0, color: Colors.black12),
//          )
        ),

        // 水平方向布局
        child: Row(
          children: <Widget>[
            _Name(fansList.data),
            _fansNum(fansList.data),
            // 返回商品图片
            // 右侧使用垂直布局
          ],
        ),
      );

  }
  // 商品名称
  Widget _Name(int fansnum) {
    return Container(
      child: Text(
        '粉丝人数',

        style: TextStyle(fontSize: 20),
      ),
    );
  }
  // 商品名称
  Widget _fansNum(int fansnum) {
    return Container(
      padding: EdgeInsets.all(0.0),
      width: 200,

      child: Text(
      '${fansnum}',
        textAlign:TextAlign.right,
        style: TextStyle(fontSize: 20,color:Color.fromRGBO(5,169,245, 1.0)),
      ),
    );
  }
}
