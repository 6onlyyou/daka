import 'dart:async';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:daka/pages/ewm.dart';
import 'package:daka/pages/fans_list_page.dart';
import 'package:daka/pages/hone_page.dart';
import 'package:daka/pages/login_page.dart';
import 'package:daka/tools/AlertWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/fans_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

Future<String> get() async {
  var userName;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  userName = await prefs.getString("loging");
  return userName;
}
Future<String> getpass() async {
  var userName;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  userName = await prefs.getString("logingpass");
  return userName;
}

class _State extends State<MyApp> {
  var homme = "";

  void initState() {
    super.initState();
    var future = get();
    future.then((value) {
      setState(() {
        homme = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
//    print('homesss是:::' + homme);
    if (homme == "null" ||homme == ""||homme == null) {
      return MaterialApp(home: Login());
    } else {
      return MaterialApp(home: HomePage());
    }
//    return Container();
  }
}
