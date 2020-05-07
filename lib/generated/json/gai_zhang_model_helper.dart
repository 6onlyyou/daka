import 'package:daka/model/gai_zhang_model.dart';

gaiZhangModelFromJson(GaiZhangModel data, Map<String, dynamic> json) {
	if (json['state'] != null) {
		data.state = json['state']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg'];
	}
	if (json['data'] != null) {
		data.data = json['data']?.toString();
	}
	return data;
}

Map<String, dynamic> gaiZhangModelToJson(GaiZhangModel entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['state'] = entity.state;
	data['msg'] = entity.msg;
	data['data'] = entity.data;
	return data;
}