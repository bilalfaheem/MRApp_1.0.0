import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mrapp/screens/ReaderScreen/provider/gas_reader_provider.dart';
import 'package:mrapp/screens/ReaderScreen/view/DialogBox/dialog_header.dart';
import 'package:mrapp/utils/constant.dart';
import 'package:provider/provider.dart';

void msgDialogBox(BuildContext context,theme, textt, bool done) {
      final _size = MediaQuery.of(context).size;
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: Duration(milliseconds: 350),
    pageBuilder: (_, __, ___) {
      return Center(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: _size.width * 0.07, vertical: _size.height * 0.02),
          width: _size.width * 0.9,
          height: _size.height * 0.28,
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Order_Dialog_Header(context),
              Container(
                margin: EdgeInsets.symmetric(vertical: _size.height*0.02),
                child: Center(
                  child: Image.asset(
                    done?
                    complete:failed,
                    // color: Colors.amber,
                    width: _size.width * 0.6,
                    height: _size.height * 0.1,
                  ),
                ),
              ),
              // SizedBox(
              //   height: _size.height * 0.02,  
              // ),
              Center(
                child: Material(
                  color: Colors.white,
                  child: Text("$textt",
                      style: GoogleFonts.ubuntu(
                          fontSize: _size.height * 0.022, color: Colors.black)),
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     ElevatedButton(
              //         style: ElevatedButton.styleFrom(
              //             primary: theme.primaryColor,
              //             shape: RoundedRectangleBorder(
              //                 borderRadius: BorderRadius.circular(30))),
              //         onPressed: () {
              //           Navigator.pop(context);
              //           Create_Order_Api_Func(context, _size.height, _size.width, theme,
              //               "70", Tanker_Type.toString());
              //         },
              //         child: Padding(
              //           padding: EdgeInsets.all(_size.height * 0.01),
              //           child: Text("Confirm",
              //               style: GoogleFonts.ubuntu(
              //                   fontSize: _size.height * 0.024, color: Colors.white)),
              //         ))
              //     // Container(
              //     //     padding: EdgeInsets.all(_size.height * 0.001),
              //     //     decoration: BoxDecoration(
              //     //         borderRadius: BorderRadius.circular(_size.height * 0.02),
              //     //         color: theme.primaryColor),
              //     //     child: TextButton(
              //     //       style: ,
              //     //         onPressed: () {},
              //     //         child: Text("Confirm",
              //     //             style: GoogleFonts.ubuntu(
              //     //                 fontSize: _size.height * 0.0,
              //     //                 color: Colors.black)))),
              //   ],
              // )
            ],
          ),
          //  SizedBox.expand(child: FlutterLogo()),
          margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(40)),
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      Tween<Offset> tween;
      if (anim.status == AnimationStatus.reverse) {
        tween = Tween(begin: Offset(-1, 0), end: Offset.zero);
      } else {
        tween = Tween(begin: Offset(1, 0), end: Offset.zero);
      }

      return SlideTransition(
        position: tween.animate(anim),
        child: FadeTransition(
          opacity: anim,
          child: child,
        ),
      );
    },
  );
}