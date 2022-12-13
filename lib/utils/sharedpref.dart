import 'package:flutter/cupertino.dart';
import 'package:mrapp/utils/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

sharedPrefLoginFunc() async {
  WidgetsFlutterBinding.ensureInitialized();

  // print("Shared Pref Login Func hit");
  SharedPreferences pref = await SharedPreferences.getInstance();
  readerLoginIdS = pref.getString("readerId").toString();
  readerLoginNameS = pref.getString("readerName").toString();
  readerLoginPhoneS = pref.getString("readerPhone").toString();
  readerLoginCnicS = pref.getString("readerCnic").toString();
  readerLoginPasswordS = pref.getString("readerPassword").toString();
  readerLoginUpdateS = pref.getString("readerUpdate").toString();
  readerLoginSocietyS = pref.getString("readerSociety").toString();
  readerLoginSocietyidS = pref.getString("readerSociety_Id").toString();

  // debugPrint("${User_Login_id_S} User id shared pref in functions");
  // print("${User_Login_update_S} User id shared pref in functions update shared");

}