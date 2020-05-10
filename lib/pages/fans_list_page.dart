import 'package:daka/model/fans_list_model.dart';
import 'package:daka/model/his_list_model.dart';
import 'package:daka/tools/UserLoggedInEvent.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import '../service/http_service.dart';

class FansListPage extends StatefulWidget {
  _FansListState createState() => _FansListState();
}

class _FansListState extends State<FansListPage> {
  // 初始化数据模型
  FansListModel goodsList = FansListModel();
  HisListModel hisList = HisListModel();

  // 滚动控制
  var scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // 获取商品数据
    print('商品1');
    _listen();
    getFans();
  }

  void _listen() {
    eventBus.on<UserLoggedInEvent>().listen((event) {
      if (event.text == "200") {
        setState(() {
          getFans();
        });
      }
    });
  }

  _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        child: ListView(
            children: List.generate(
          hisList.data.length,
          (index) => InkWell(
              child: Container(
                  alignment: Alignment.center,
                  height: 40.0,
                  child: Text(
                      '${hisList.data[index].typeName}元打卡时间:${hisList.data[index].signTime}')),
              onTap: () {
                print('tapped item ${index + 1}');
                Navigator.pop(context);
              }),
        )),
        height: 200,
      ),
    );
  }

  void getHisFans(int posion) async {
    progressDialog(context);
    // 请求url
    var url =
        'http://www.konkonyu.com/appservice/wechat/qrcode/getUsreClockHistoryList';
    // 请求参数：店铺Id
    var formData = {'userId': goodsList.data[posion].userId, 'merchantId': '9'};

    // 调用请求方法传入url及表单数据
    await request(url, formData: formData).then((value) {
      // 返回数据进行Json解码
      var data = json.decode(value.toString());
      // 打印数据
      print('商品列表数据Json格式:::' + data.toString());

      // 设置状态刷新数据
      setState(() {
        // 将返回的Json数据转换成Model
        var hisListModel = new HisListModel();
        hisList = hisListModel.fromJson(data);
        Navigator.of(context).pop();
        _showModalBottomSheet(context);
      });
    });
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
              height: 60,
              width: 60,
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

  void getFans() async {
    // 请求url
    var url = 'http://www.konkonyu.com/appservice/wechat/qrcode/getFansList';
    // 请求参数：店铺Id
    var formData = {'merchantId': '9'};

    // 调用请求方法传入url及表单数据
    await request(url, formData: formData).then((value) {
      // 返回数据进行Json解码

      var data = json.decode(value.toString());
      // 打印数据
      print('商品列表数据Json格式:::' + data.toString());

      // 设置状态刷新数据
      setState(() {
        // 将返回的Json数据转换成Model
        var fansListModel = new FansListModel();
        goodsList = fansListModel.fromJson(data);
      });
    });
  }

  // 商品列表项
  Widget _ListWidget(BuildContext context, List newList, int index) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      height: 80,
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
      child: new FlatButton(
        // 水平方向布局
        onPressed: () => getHisFans(index),
//      onPressed:myHisDialog(context) ,
//      onPressed: myHisDialog(context),
        child: Row(
          children: <Widget>[
            // 返回商品图片
            _goodsImage(newList, index),
            SizedBox(
              width: 16,
            ),
            // 右侧使用垂直布局
            Column(
              children: <Widget>[
                _goodsName(newList, index),
                _goodsPrice(newList, index),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // 商品图片
  Widget _goodsImage(List newList, int index) {
    return Container(
      child: ClipOval(
        // 固定大小
        child: SizedBox(
          width: 48,
          height: 48,
          // 添加图片
          child: Image.network(
            newList[index].wechatHeadimg,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }

  // 商品名称
  Widget _goodsName(List newList, int index) {
    return Container(
      padding: EdgeInsets.all(0.0),
      width: 200,
      child: Text(
        newList[index].wechatNickname,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 15),
      ),
    );
  }

  // 商品价格
  Widget _goodsPrice(List newList, int index) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      width: 200,
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 7.0, right: 7.0),
            height: 18,
            decoration: BoxDecoration(
              color: Color.fromRGBO(196, 236, 255, 1.0),
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
            child: Center(
              child: Text(
                '${newList[index].typeSignCount[0].typeName}元打卡:${newList[index].typeSignCount[0].typeSignCount == null ? 0 : newList[index].typeSignCount[0].typeSignCount}次',
                style: TextStyle(
                  color: Color.fromRGBO(5, 169, 245, 1.0),
                  fontSize: 11,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 7.0, right: 7.0),
            height: 18,
            margin: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: Color.fromRGBO(196, 236, 255, 1.0),
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
            child: Center(
              child: Text(
                '${newList[index].typeSignCount[1].typeName}元打卡:${newList[index].typeSignCount[1].typeSignCount == null ? 0 : newList[index].typeSignCount[1].typeSignCount.toString()}次',
                style: TextStyle(
                  color: Color.fromRGBO(234, 84, 143, 1.0),
                  fontSize: 11,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // 通过商品列表数组长度判断是否有数据
//    if (goodsList.data.length > 0) {
    return ListView.builder(
      // 滚动控制器

      controller: scrollController,
      // 列表长度
      itemCount: goodsList.data.length,
      // 列表项构造器
      itemBuilder: (context, index) {
        // 列表项，传入列表数据及索引

        return _ListWidget(context, goodsList.data, index);
      },
    );
  }
// 商品列表没有数据时返回空容器
//    return Container();
//  }
}
