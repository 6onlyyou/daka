import 'dart:convert';

import 'package:daka/model/fans_data_model.dart';
import 'package:daka/pages/hone_page.dart';
import 'package:daka/service/http_service.dart';
import 'package:daka/tools/Toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatelessWidget {
  save(BuildContext context,String loging,String password) async {
    print(password+loging);
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("logingpass", password);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("loging", loging);
    Navigator.pop(context);
    Navigator.push(
      context,
      new MaterialPageRoute(
        builder: (context) => new HomePage(),
      ),

    );
  }

  Future progressDialog(context) {
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
              height: ScreenUtil().setHeight(60),
              width: ScreenUtil().setWidth(60),
              // 圆形进度条
              child: CircularProgressIndicator(
                strokeWidth: 3.0,
//                    backgroundColor: Colors.blue,
                // value: 0.2,
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
              ),
            )),
          ),
        );
      },
    );
  }

  FansDataModel hisList = FansDataModel();

  void getLogin(
      BuildContext context, String wechatAccount, String password) async {
    progressDialog(context);
    // 请求url
    var url = 'http://www.konkonyu.com/appservice/wechat/qrcode/login';
    // 请求参数：店铺Id
    var formData = {'wechatAccount': wechatAccount, 'password': password};

    // 调用请求方法传入url及表单数据
    await request(url, formData: formData).then((value) {
      // 返回数据进行Json解码
      var data = json.decode(value.toString());
      // 打印数据
      print('Json格式:::' + data.toString());

      // 设置状态刷新数据
      // 将返回的Json数据转换成Model
      var hisListModel = new FansDataModel();
      hisList = hisListModel.fromJson(data);
      Navigator.of(context).pop();
      if(hisList.state==200){
        save(context,hisList.data.toString(),password);
      }else{
        Toast.toast(context, msg: "账户密码错误！", position: ToastPostion.bottom);

      }


    });
  }
  var _username= new TextEditingController();
  var _password= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 375, height: 812, allowFontScaling: false);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.blueGrey,
            radius: 40,
            child: Text("BOOS",
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 18,
                    color: Colors.white)),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              padding: EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                controller: _username,
//                inputFormatters: [
//                  WhitelistingTextInputFormatter(RegExp("[a-zA-Z]")),//只允许输入字母
//                  WhitelistingTextInputFormatter.digitsOnly,
//                ],
                keyboardType: TextInputType.number,
                style: TextStyle(
                  color: Color.fromRGBO(102, 102, 102, 1.0),
                  fontSize: 15,
                ),
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: "请输入用户名"),
              ),
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.grey[300]),
                  borderRadius: BorderRadius.circular(8))),
          SizedBox(
            height: 10,
          ),
          Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              padding: EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                keyboardType: TextInputType.text,
                obscureText: true,
                controller: _password,
//                inputFormatters: [
//                  WhitelistingTextInputFormatter(RegExp("[a-zA-Z]")),//只允许输入字母
//                  WhitelistingTextInputFormatter.digitsOnly,
//                ],
                style: TextStyle(
                  color: Color.fromRGBO(102, 102, 102, 1.0),
                  fontSize: 15,
                ),
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: "请输入密码"),
              ),
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.grey[300]),
                  borderRadius: BorderRadius.circular(8))),
          SizedBox(
            height: 8,
          ),
//          Row(
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            children: <Widget>[
//              FlatButton(
//                onPressed: () {},
//                child: Text("忘记密码"),
//              ),
//              FlatButton(
//                onPressed: () {
//                  Navigator.of(context).pushNamed("/reg");
//                },
//                child: Text("用户注册"),
//              ),
//            ],
//          ),
          SizedBox(
            height: 16,
          ),
          FlatButton(
            onPressed: () {
              getLogin(context,_username.text,_password.text);
            },
            child: CircleAvatar(
              radius: 40,
              child: Icon(Icons.arrow_forward),
            ),
          )
        ],
      ),
    );
  }
}
