import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatelessWidget {
  save(String loging) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("loging", loging);
  }
  @override
  Widget build(BuildContext context) {
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
              margin: EdgeInsets.only(left: 20,right: 20),
              padding: EdgeInsets.only(left: 10,right: 10),

              child: TextField(
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
              margin: EdgeInsets.only(left: 20,right: 20),
              padding: EdgeInsets.only(left: 10,right: 10),

              child: TextField(
                keyboardType: TextInputType.text,

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

              save("1");
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