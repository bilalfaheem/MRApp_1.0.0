import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mrapp/Model/visitor_history/visitor_history.dart';
import 'package:mrapp/screens/ReaderScreen/view/DialogBox/msg_dialog_box.dart';
import 'package:mrapp/screens/SecurityScreen/view/security_success_screen.dart';
import 'package:mrapp/utils/constant.dart';


List<VisitorHistory> scanHistoryList = [];

Future<void> scanApiFunc(context, String qrCode) async {
  final theme = Theme.of(context);
  print("calllllllllllllllllllllllllllllllllllllllllll Scan func cal");
  final response = await post(Uri.parse("${apiAddress}qr_scan.php"),
      body: {"qr_code": qrCode, "guard_id": "1"});

  var data = jsonDecode(response.body.toString());

  if (response.statusCode == 200) {
    var dataStatus = data["status"].toString();

    if (dataStatus == "200") {
      // scanHistoryList.clear();
      var dataResponse = data["response"];
      // for(Map i in dataResponse){
      //   scanHistoryList.add(VisitorHistory.fromJson(i));
      // }
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SecuritySuccessScreen(
                  name:dataResponse.first["guest"]["contact_name"].toString(),
                  unitNo: dataResponse.first["passess"]["address"].toString(),
                  eventType: dataResponse.first["passess"]["pass_event"].toString(),
                  passType: dataResponse.first["passess"]["pass_type"].toString(),
                  validTill: dataResponse.first["passess"]["end_date"].toString(),)));
      print("Scan succesful");
    } else if (dataStatus == "400") {
      Navigator.pop(context);
      msgDialogBox(context, theme, "textt", false);
      print("scan failed");
    } else {
      print("scan is not 200 or 404");
    }
  } else {
    print('failed');
    print(data["status"]);
  }
}
