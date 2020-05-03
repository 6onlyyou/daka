import 'package:daka/model/fans_list_model.dart';

fansListModelFromJson(FansListModel data, Map<String, dynamic> json) {
	if (json['state'] != null) {
		data.state = json['state']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg'];
	}
	if (json['data'] != null) {
		data.data = new List<FansListData>();
		(json['data'] as List).forEach((v) {
			data.data.add(new FansListData().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> fansListModelToJson(FansListModel entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['state'] = entity.state;
	data['msg'] = entity.msg;
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	return data;
}

fansListDataFromJson(FansListData data, Map<String, dynamic> json) {
	if (json['typeSignCount'] != null) {
		data.typeSignCount = new List<FansListDataTypeSignCount>();
		(json['typeSignCount'] as List).forEach((v) {
			data.typeSignCount.add(new FansListDataTypeSignCount().fromJson(v));
		});
	}
	if (json['wechatNickname'] != null) {
		data.wechatNickname = json['wechatNickname']?.toString();
	}
	if (json['wechatHeadimg'] != null) {
		data.wechatHeadimg = json['wechatHeadimg']?.toString();
	}
	if (json['userId'] != null) {
		data.userId = json['userId']?.toInt();
	}
	return data;
}

Map<String, dynamic> fansListDataToJson(FansListData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.typeSignCount != null) {
		data['typeSignCount'] =  entity.typeSignCount.map((v) => v.toJson()).toList();
	}
	data['wechatNickname'] = entity.wechatNickname;
	data['wechatHeadimg'] = entity.wechatHeadimg;
	data['userId'] = entity.userId;
	return data;
}

fansListDataTypeSignCountFromJson(FansListDataTypeSignCount data, Map<String, dynamic> json) {
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
		data.typeSignCount = json['typeSignCount']?.toInt();
	}
	if (json['prizeList'] != null) {
		data.prizeList = json['prizeList'];
	}
	return data;
}

Map<String, dynamic> fansListDataTypeSignCountToJson(FansListDataTypeSignCount entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['typeId'] = entity.typeId;
	data['typeName'] = entity.typeName;
	data['merchantId'] = entity.merchantId;
	data['typeSignCount'] = entity.typeSignCount;
	data['prizeList'] = entity.prizeList;
	return data;
}