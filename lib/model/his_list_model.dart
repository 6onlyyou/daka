import 'package:daka/generated/json/base/json_convert_content.dart';

class HisListModel with JsonConvert<HisListModel> {
	int state;
	dynamic msg;
	List<HisListData> data;
}

class HisListData with JsonConvert<HisListData> {
	String typeName;
	String signTime;
}
