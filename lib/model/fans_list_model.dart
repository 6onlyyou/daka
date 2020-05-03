import 'package:daka/generated/json/base/json_convert_content.dart';

class FansListModel with JsonConvert<FansListModel> {
	int state;
	dynamic msg;
	List<FansListData> data;
}

class FansListData with JsonConvert<FansListData> {
	List<FansListDataTypeSignCount> typeSignCount;
	String wechatNickname;
	String wechatHeadimg;
	int userId;
}

class FansListDataTypeSignCount with JsonConvert<FansListDataTypeSignCount> {
	int typeId;
	String typeName;
	dynamic merchantId;
	int typeSignCount;
	dynamic prizeList;
}
