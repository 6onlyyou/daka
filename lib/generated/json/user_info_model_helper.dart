import 'package:daka/model/user_info_model.dart';

userInfoModelFromJson(UserInfoModel data, Map<String, dynamic> json) {
	if (json['state'] != null) {
		data.state = json['state']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg'];
	}
	if (json['data'] != null) {
		data.data = new UserInfoData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> userInfoModelToJson(UserInfoModel entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['state'] = entity.state;
	data['msg'] = entity.msg;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	return data;
}

userInfoDataFromJson(UserInfoData data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['wechatAccount'] != null) {
		data.wechatAccount = json['wechatAccount']?.toString();
	}
	if (json['wechatNickname'] != null) {
		data.wechatNickname = json['wechatNickname']?.toString();
	}
	if (json['wechatHeadimg'] != null) {
		data.wechatHeadimg = json['wechatHeadimg']?.toString();
	}
	if (json['qrCode'] != null) {
		data.qrCode = json['qrCode']?.toString();
	}
	if (json['registerTime'] != null) {
		data.registerTime = json['registerTime']?.toString();
	}
	if (json['level'] != null) {
		data.level = json['level'];
	}
	if (json['ruleName'] != null) {
		data.ruleName = json['ruleName']?.toString();
	}
	if (json['types'] != null) {
		data.types = json['types'];
	}
	if (json['typeSignCount'] != null) {
		data.typeSignCount = new List<UserInfoDataTypeSignCount>();
		(json['typeSignCount'] as List).forEach((v) {
			data.typeSignCount.add(new UserInfoDataTypeSignCount().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> userInfoDataToJson(UserInfoData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['wechatAccount'] = entity.wechatAccount;
	data['wechatNickname'] = entity.wechatNickname;
	data['wechatHeadimg'] = entity.wechatHeadimg;
	data['qrCode'] = entity.qrCode;
	data['registerTime'] = entity.registerTime;
	data['level'] = entity.level;
	data['ruleName'] = entity.ruleName;
	data['types'] = entity.types;
	if (entity.typeSignCount != null) {
		data['typeSignCount'] =  entity.typeSignCount.map((v) => v.toJson()).toList();
	}
	return data;
}

userInfoDataTypeSignCountFromJson(UserInfoDataTypeSignCount data, Map<String, dynamic> json) {
	if (json['typeId'] != null) {
		data.typeId = json['typeId']?.toInt();
	}
	if (json['typeName'] != null) {
		data.typeName = json['typeName']?.toString();
	}
	if (json['merchantId'] != null) {
		data.merchantId = json['merchantId'];
	}
	if (json['typeSignCount'] != null) {
		data.typeSignCount = json['typeSignCount'];
	}
	if (json['prizeList'] != null) {
		data.prizeList = json['prizeList'];
	}
	return data;
}

Map<String, dynamic> userInfoDataTypeSignCountToJson(UserInfoDataTypeSignCount entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['typeId'] = entity.typeId;
	data['typeName'] = entity.typeName;
	data['merchantId'] = entity.merchantId;
	data['typeSignCount'] = entity.typeSignCount;
	data['prizeList'] = entity.prizeList;
	return data;
}