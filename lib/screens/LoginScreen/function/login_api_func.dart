import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mrapp/screens/HomeScreen/view/home_screen.dart';
import 'package:mrapp/utils/loading.dart';
import 'package:mrapp/utils/sharedpref.dart';
import 'package:mrapp/utils/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

var L_status = 100;

// List<LoginUserModel> Profile_List = [];
// var userLoginData;

// for first and second round validation
bool Login_Cnic_Validation = false;
bool Login_Password_validation = false;

// Future<List<UserProfileModel>>
Future<void> Login_Post_Api(
    context, Login_key, String cnic, String password) async {
  print("Login api hitttttttttttttttttttttt");
  final response =
      await post(Uri.parse('${apiAddress}passes/login.php'), body: {
    "phone": cnic,
    'password': password,
  });

  L_status = 99;
  // Login_key.currentState!.validate();

  if (response.statusCode == 200) {
    print("2000000");
    final userLoginData = jsonDecode(response.body.toString());

    print('Post Succesfull');
    L_status = userLoginData["status"];
    print("Status $L_status");

// second round validation start
    Login_validation_status(true);
// validate
    Login_key.currentState!.validate();

    // if (L_status == 0) {
    //   print("not register");
    // } else
    if (L_status == 1) {
      loadingIndicator(context);

      final userLoginDataResponse = userLoginData["response"];

      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString("readerId", userLoginDataResponse[0]["id"]);
      pref.setString("readerName", userLoginDataResponse[0]["name"]);
      pref.setString("readerPhone", userLoginDataResponse[0]["phone"]);
      pref.setString("readerCnic", userLoginDataResponse[0]["cnic"]);
      pref.setString("readerPassword", userLoginDataResponse[0]["password"]);
      pref.setString("readerUpdate", userLoginDataResponse[0]["is_updated"]);
      pref.setString("readerSociety", userLoginDataResponse[0]["project_name"]);
      pref.setString(
          "readerSociety_Id", userLoginDataResponse[0]["project_id"]);

      //1.0.3
      sharedPrefLoginFunc();
      // 1.0.3

      // for society name visibility provider
      //  final Society_Name_Visibility_provider = Provider.of<SocietyNameVisibilityProvider>(context, listen: false);

      Timer(Duration(seconds: 3), () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
            (route) => false);
        // second round validation end
        Login_validation_status(false);
        // Society_Name_Visibility_provider.SocietyNameVisibilityStatus_Func(false);
      });
    } else {
      print("some thing has gone wrong");
      // return Profile_List;
    }
  } else {
    print('failed');
    Login_key.currentState!.validate();
    // return Profile_List;
  }
  // } catch (e) {
  //   print(e.toString());
  // }
}

void Login_validation_status(bool status) {
  print("Login validation changes $status");
  Login_Cnic_Validation = status;
  Login_Password_validation = status;
}

// {
//         "id": "4",
//         "project_id": "1",
//         "created_by": "1",
//         "name": "hamza",
//         "phone": "03172746242",
//         "password": "pakistan",
//         "is_active": "1",
//         "is_block": "0",
//         "created_at": "2023-02-28 15:20:55"
//     }
