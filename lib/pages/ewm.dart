
import 'package:flutter/material.dart';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
class ewMPage extends StatefulWidget {
//  final Product product;
//  ewMPage({Key key, @required this.product}):super(key:key);
  ewMPage({Key key}) : super(key: key);
  @override
  _State createState() => _State();
}

class _State extends State<ewMPage> {
  String barcode;

  Future _scan() async {
    try {
      String barcode = (await BarcodeScanner.scan()) as String;
      setState(() {
        return this.barcode = barcode;
      });
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          return this.barcode = 'The user did not grant the camera permission!';
        });
      } else {
        setState(() {
          return this.barcode = 'Unknown error: $e';
        });
      }
    } on FormatException {
      setState(() => this.barcode =
      'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      setState(() => this.barcode = 'Unknown error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.photo_camera),
          onPressed: _scan,
        ),
        appBar: AppBar(
          title: Text("扫码"),
        ),
        body: Text("${barcode}")
    );
  }
}
