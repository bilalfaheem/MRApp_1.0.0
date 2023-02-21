// interner connection status
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

bool hasConnection = false;

Future<void> connectivityStatusFunc(context) async {
  hasConnection = false;

  hasConnection = await InternetConnectionChecker().hasConnection;
  if (hasConnection == false) {
    dd(context);
  }
//   else if(hasConnection == true){
// func;
//   }
}

Future<void> connectivity_func_pop(context) async {
  hasConnection = false;

  hasConnection = await InternetConnectionChecker().hasConnection;
  if (hasConnection == false) {
    Navigator.pop(context);
    dd(context);
  }
//   else if(hasConnection == true){
// func;
//   }
}

void dd(context) {
  ScaffoldMessenger.of(context).showSnackBar(
    new SnackBar(
      backgroundColor: Theme.of(context).primaryColorLight,
      //  Color.fromARGB(133, 76, 175, 79),

      // backgroundColor: Colors.amber,
      content: Container(
        // height: 40,
        // color: Colors.amber,
        child: ListTile(
            leading: Icon(Icons.signal_wifi_connected_no_internet_4_sharp,
                color: Colors.white),
            title: Text("No Internet",
                style: GoogleFonts.ubuntu(
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                    color: Colors.white))),
      ),
      // Text('No Internet Access'),

      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(MediaQuery.of(context).size.width * 0.03),
      ),
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height * 0.75,
          right: MediaQuery.of(context).size.width * 0.05,
          left: MediaQuery.of(context).size.width * 0.05),
    ),
  );
}
