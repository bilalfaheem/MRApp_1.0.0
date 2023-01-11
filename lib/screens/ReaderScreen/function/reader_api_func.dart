import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:mrapp/screens/ReaderScreen/provider/gas_reader_provider.dart';
import 'package:mrapp/screens/ReaderScreen/view/DialogBox/loading_dialog_box.dart';
import 'package:mrapp/screens/ReaderScreen/view/DialogBox/msg_dialog_box.dart';
import 'package:mrapp/utils/constant.dart';
import 'package:provider/provider.dart';

import "package:async/async.dart";

import 'package:path/path.dart';


Future addGasReadingFunc(context,theme,File imageFile,addressId,previousReading,currentReading) async{
// ignore: deprecated_member_use
print("address ID$addressId previousReading$previousReading currentReading$currentReading");
final gasReaderProvider = Provider.of<GasReaderProvider>(context, listen: false);
var stream= new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
var length= await imageFile.length();
var uri = Uri.parse("https://cybernsoft.com/api/create_gas_bill.php");

var request = new http.MultipartRequest("POST", uri);

var multipartFile = new http.MultipartFile("image", stream, length, filename: basename(imageFile.path));

request.files.add(multipartFile);
request.fields['address_id'] = addressId.toString();
request.fields['previous_reading'] = previousReading.toString();
request.fields['current_reading'] = currentReading.toString();
request.fields['g_user_id'] = readerLoginIdS;

var respond = await request.send();
if(respond.statusCode==200){
  gasReaderProvider.addressSearchingFunc(true);
  Navigator.pop(context);
  msgDialogBox(context, theme, "Successfully Added",true);
  
  // print("Image Uploaded");
}else{
  Navigator.pop(context);
  msgDialogBox(context, theme, "Failed to Add",false);
  // print("Upload Failed");
}}



// upload(File imageFile) async {    
//       // open a bytestream
//       var stream = new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
//       // get file length
//       var length = await imageFile.length();

//       // string to uri
//       var uri = Uri.parse("https://cybernsoft.com/api/create_gas_bill.php");

//       // create multipart request
//       var request = new http.MultipartRequest("POST", uri);

//       // multipart that takes file
//       var multipartFile = new http.MultipartFile('file', stream, length,
//           filename: basename(imageFile.path));

//       // add file to multipart
//       request.files.add(multipartFile);

//       // send
//       var response = await request.send();
//       print(response.statusCode);

//       // listen for response
//       response.stream.transform(utf8.decoder).listen((value) {
//         print(value);
//       });
//     }



Future readerApi(context,theme,String readerId,String addressId, String previousReader,String currentReading) async {
  // print(readerId+addressId+previousReader+currentReading);
  // print("$readerId readerId");
  // print("$addressId Address Id");
  // print("$previousReader previous reader");
  // print("$currentReading current reading");

  final gasReaderProvider = Provider.of<GasReaderProvider>(context, listen: false);
  Navigator.pop(context);
  Order_dialog_loading(context, theme);

  // LogoutCheckFunc(userId,context);
  final Response = await http.post(Uri.parse("${apiAddress}create_gas_bill.php"), body: {
        "g_user_id": readerId,
        "address_id": addressId,
        "previous_reading":previousReader,
        "current_reading": currentReading,
        "image": File(meterImageFilePath)
        });

  if (Response.statusCode == 200) {
   
    var data = jsonDecode(Response.body.toString());
    String statusReaderApi= data["status"].toString();
    // print(statusReaderApi);
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
    // print("reader Api response is not 200");
    // return Active_User_List;
  }
}