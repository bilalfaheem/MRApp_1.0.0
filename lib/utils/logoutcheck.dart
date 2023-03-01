import 'dart:convert';
import 'package:http/http.dart' as http;
import 'constant.dart';

void logoutCheck(context,String guardId,String isUpdated) async {
  final reponse = await http.post(
      Uri.parse("${apiAddress}passes/login_check.php"),
      body: {
        "guard_id": guardId,
        "is_updated":isUpdated
      });

      

  if (reponse.statusCode == 200) {
    var updateData = jsonDecode(reponse.body.toString());
    print("<<<<<<<<<<<<<<<<<<<<<${updateData["status"].toString()}>>>>>>>>>>>>>>>>>>>>>");
    if(updateData["status"].toString() == "0"){
      print("<<<<<<<<<<<<<<<<,logout>>>>>>>>>>>>>>>>");
    }

    // if (readerLoginUpdateS != updateData[0]["is_updated"].toString() ||
    //     readerLoginIdS == null ||
    //     readerLoginIdS == "null") {
    //   // logOut(context,false);
    //   print("LogOut");
    // }
  }
}
