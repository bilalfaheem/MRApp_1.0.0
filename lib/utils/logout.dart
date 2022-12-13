import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mrapp/screens/LoginScreen/view/login_screen.dart';
import 'package:mrapp/utils/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

logOut(context,bool loading) async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();

  pref.clear();

// variable Clear
readerLoginIdS = "null";
readerLoginNameS= "null";
readerLoginPhoneS= "null";
readerLoginCnicS= "null";
readerLoginPasswordS = "null";
readerLoginUpdateS = "null";
readerLoginSocietyS = "null";
readerLoginSocietyidS = "null";


  Timer(
   Duration(seconds: loading? 2:0),
  () =>
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (route) => false)
  );
}
