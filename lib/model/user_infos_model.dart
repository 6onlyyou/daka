import 'package:daka/generated/json/base/json_convert_content.dart';

class UserInfosModel with JsonConvert<UserInfosModel> {
	int state;
	dynamic msg;
	UserInfosData data;
}

class UserInfosData with JsonConvert<UserInfosData> {
	int id;
	String wechatAccount;
	String wechatNickname;
	String wechatHeadimg;
	String qrCode;
	String registerTime;
	dynamic level;
	String ruleName;
	dynamic types;
	List<UserInfosDataTypeSignCount> typeSignCount;
}

class UserInfosDataTypeSignCount with JsonConvert<UserInfosDataTypeSignCount> {
	int typeId;
	String typeName;
	dynamic merchantId;
	dynamic typeSignCount;
	dynamic prizeList;
	bool havePrizeFlag;
}
