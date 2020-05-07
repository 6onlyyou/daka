import 'package:daka/model/his_list_model.dart';

hisListModelFromJson(HisListModel data, Map<String, dynamic> json) {
	if (json['state'] != null) {
		data.state = json['state']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg'];
	}
	if (json['data'] != null) {
		data.data = new List<HisListData>();
		(json['data'] as List).forEach((v) {
			data.data.add(new HisListData().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> hisListModelToJson(HisListModel entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['state'] = entity.state;
	data['msg'] = entity.msg;
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	return data;
}

hisListDataFromJson(HisListData data, Map<String, dynamic> json) {
	if (json['typeName'] != null) {
		data.typeName = json['typeName']?.toString();
	}
	if (json['signTime'] != null) {
		data.signTime = json['signTime']?.toString();
	}
	return data;
}

Map<String, dynamic> hisListDataToJson(HisListData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['typeName'] = entity.typeName;
	data['signTime'] = entity.signTime;
	return data;
}