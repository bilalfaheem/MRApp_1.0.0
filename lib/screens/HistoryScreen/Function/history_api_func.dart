import 'dart:convert';

import 'package:mrapp/Model/history_data_model/history_data_model.dart';
import 'package:http/http.dart' as https;
import 'package:mrapp/utils/constant.dart';

// List<VisitorHistory> visitorHistoryList = [];

List<HistoryDataModel> historyList = [];
Future<List<HistoryDataModel>> historyApiFunction() async {
  final response = await https.post(
      Uri.parse("${apiAddress}gas_meter_history.php"),
      body: {"g_user_id": readerLoginIdS});
  print("hittttttttt");

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body.toString());
    if(data["status"].toString() == "1"){
 var dataResponse = data["response"];
    historyList.clear();

    for (Map i in dataResponse) {
      historyList.add(HistoryDataModel.fromJson(i)); 
    }
    }
   
    print(data);
    return historyList;
  } else {
    return historyList;
  }
}