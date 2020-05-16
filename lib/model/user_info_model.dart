import 'package:daka/generated/json/base/json_convert_content.dart';

class UserInfoModel with JsonConvert<UserInfoModel> {
	int state;
	dynamic msg;
	UserInfoData data;
}

class UserInfoData with JsonConvert<UserInfoData> {
	int id;
	String wechatAccount;
	String wechatNickname;
	String wechatHeadimg;
	String qrCode;
	String registerTime;
	dynamic level;
	String ruleName;
	dynamic types;
	List<UserInfoDataTypeSignCount> typeSignCount;
}

class UserInfoDataTypeSignCount with JsonConvert<UserInfoDataTypeSignCount> {
	int typeId;
	String typeName;
	dynamic merchantId;
	dynamic typeSignCount;
	dynamic prizeList;
}
