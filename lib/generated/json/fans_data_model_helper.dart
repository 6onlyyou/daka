import 'package:daka/model/fans_data_model.dart';

fansDataModelFromJson(FansDataModel data, Map<String, dynamic> json) {
	if (json['state'] != null) {
		data.state = json['state']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg'];
	}
	if (json['data'] != null) {
		data.data = json['data']?.toInt();
	}
	return data;
}

Map<String, dynamic> fansDataModelToJson(FansDataModel entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['state'] = entity.state;
	data['msg'] = entity.msg;
	data['data'] = entity.data;
	return data;
}