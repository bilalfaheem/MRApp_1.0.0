import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:mrapp/screens/ReaderScreen/provider/gas_reader_provider.dart';
import 'package:mrapp/screens/ReaderScreen/view/DialogBox/confirm_dialog_box.dart';
import 'package:mrapp/screens/ReaderScreen/view/DialogBox/loading_dialog_box.dart';
import 'package:mrapp/screens/ReaderScreen/view/DialogBox/msg_dialog_box.dart';
import 'package:mrapp/utils/constant.dart';
import 'package:provider/provider.dart';

Future readerApi(context,theme,String readerId,String addressId, String previousReader,String currentReading) async {
  print(readerId+addressId+previousReader+currentReading);
  print("$readerId readerId");
  print("$addressId Address Id");
  print("$previousReader previous reader");
  print("$currentReading current reading");

  final gasReaderProvider = Provider.of<GasReaderProvider>(context, listen: false);
  Navigator.pop(context);
  Order_dialog_loading(context, theme);

  // LogoutCheckFunc(userId,context);
  final Response = await http.post(Uri.parse("${apiAddress}create_gas_bill.php"), body: {
        "g_user_id": readerId,
        "address_id": addressId,
        "previous_reading":previousReader,
        "current_reading": currentReading,
        "image":"image"
        });

  if (Response.statusCode == 200) {
   
    var data = jsonDecode(Response.body.toString());
    String statusReaderApi= data["status"].toString();
    print(statusReaderApi);
    if(statusReaderApi == "200"){
      Navigator.pop(context);
      msgDialogBox(context, theme, "Successfully Added",true);
      gasReaderProvider.addressSearchingFunc(true);

    }else{
      Navigator.pop(context);
      msgDialogBox(context, theme, "Failed to Add",false);
    }

    // for (Map i in data) {
    //   Active_User_List.add(SingleUserModell.fromJson(i));
    // }



    // return Active_User_List;
  } else {
    print("reader Api response is not 200");
    // return Active_User_List;
  }
}