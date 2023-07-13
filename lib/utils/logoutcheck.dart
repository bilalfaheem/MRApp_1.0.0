import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mrapp/utils/logout.dart';
import 'constant.dart';

void logoutCheck(context, String guardId, String isUpdated) async {
  print("<<<<<<<<<<<<<<<<<<<<<<<$isUpdated>>>>>>>>>>>>>isupdated>>>>>>>>>>");
  final reponse = await http.post(
      Uri.parse("${apiAddress}passes/login_check.php"),
      body: {"guard_id": guardId, "is_updated": isUpdated});

  if (reponse.statusCode == 200) {
    var updateData = jsonDecode(reponse.body.toString());
    print(updateData);
    print(
        "<<<<<<<<<<<<<<<<<<<<<${updateData["status"].toString()}>>>>>>>>>>>>>>>>>>>>>");
    if (updateData["status"].toString() == "0") {
      print("<<<<<<<<<<<<<<<<,logout>>>>>>>>>>>>>>>>");
      // logOut(context, false);//remove
    }

    // if (readerLoginUpdateS != updateData[0]["is_updated"].toString() ||
    //     readerLoginIdS == null ||
    //     readerLoginIdS == "null") {
    //   // logOut(context,false);
    //   print("LogOut");
    // }
  }
}
