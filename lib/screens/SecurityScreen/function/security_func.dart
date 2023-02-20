import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mrapp/screens/SecurityScreen/view/security_success_screen.dart';
import 'package:mrapp/utils/constant.dart';


Future<void> scanApiFunc(context, String qrCode) async {
  print("calllllllllllllllllllllllllllllllllllllllllll Scan func cal");
  final response = await post(Uri.parse("${apiAddress}qr_scan.php"),
      body: {"qr_code": qrCode,"guard_id":"1"});

  var data = jsonDecode(response.body.toString());

  if (response.statusCode == 200) {
    var dataStatus = data["status"].toString();

    if (dataStatus == "200") {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>SecuritySuccessScreen()));
      print("Scan succesful");
    } else if (dataStatus== "404") {
      Navigator.pop(context);
      print("scan failed");
    } else {
      print("scan is not 200 or 404");
    }
  } else {
    print('failed');
    print(data["status"]);
  }
}