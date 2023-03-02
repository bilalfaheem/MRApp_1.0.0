import 'dart:convert';

import 'package:mrapp/Model/visitor_history/visitor_history.dart';
import 'package:mrapp/Model/visitorhistorymodel/visitorhistorymodel.dart';
import 'package:http/http.dart' as https;
import 'package:mrapp/utils/constant.dart';

// List<VisitorHistory> visitorHistoryList = [];

List visitorHistoryListt = [];
Future<List> visitorHistoryFuncc() async {
  final response = await https.post(
      Uri.parse("${apiAddress}passes/qr_scan_history.php"),
      body: {"guard_id": readerLoginIdS});
  print("hittttttttt");

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body.toString());
    visitorHistoryListt.clear();

    for (Map i in data) {
      visitorHistoryListt.add(i); 
    }
    print(data);
    return visitorHistoryListt;
  } else {
    return visitorHistoryListt;
  }
}

// Future<List<VisitorHistory>> visitorHistoryFunc() async {
//   final response = await https.post(
//       Uri.parse("${apiAddress}passes/qr_scan_history.php"),
//       body: {"guard_id": readerLoginIdS});
//   print("hittttttttt");

//   if (response.statusCode == 200) {
//     var data = jsonDecode(response.body.toString());
//     visitorHistoryList.clear();

//     for (Map i in data) {
//       visitorHistoryList.add(i);
//       visitorHistoryList.add(VisitorHistory.fromJson(i));
//     }

//     return visitorHistoryList;
//   } else {
//     return visitorHistoryList;
//   }
// }
