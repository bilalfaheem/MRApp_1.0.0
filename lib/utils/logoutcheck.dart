import 'dart:convert';
import 'package:http/http.dart' as http;
import 'constant.dart';

void logoutCheck(String userId, context) async {
  final reponse = await http
      .post(Uri.parse("${apiAddress}gas_user_updated.php"), body: {"id": userId});

  if (reponse.statusCode == 200) {
    var updateData = jsonDecode(reponse.body.toString());

    print("${updateData[0]["is_updated"]} User Updated ");

    print("${readerLoginUpdateS} shared update");

    if (readerLoginUpdateS != updateData[0]["is_updated"].toString()
     || readerLoginIdS == null || readerLoginIdS == "null"
    ) {
      // logOut(context,false);
       print("LogOut");
    } 
  }
}