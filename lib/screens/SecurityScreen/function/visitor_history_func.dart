import 'dart:convert';

import 'package:mrapp/Model/visitor_history/visitor_history.dart';
import 'package:mrapp/Model/visitorhistorymodel/visitorhistorymodel.dart';
import 'package:http/http.dart' as https;
import 'package:mrapp/utils/constant.dart';

List<VisitorHistory> visitorHistoryList = [];

Future<List<VisitorHistory>> visitorHistoryFunc() async {
  final response = await https.post(
      Uri.parse("${apiAddress}passes/qr_scan_history.php"),
      body: {"guard_id": "1"});
  print("hittttttttt");

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body.toString());
    visitorHistoryList.clear();

    for (Map i in data) {
      visitorHistoryList.add(VisitorHistory.fromJson(i));
    }

    return visitorHistoryList;
  } else {
    return visitorHistoryList;
  }
}
