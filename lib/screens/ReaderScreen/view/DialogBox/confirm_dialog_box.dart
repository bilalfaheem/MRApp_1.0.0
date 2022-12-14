import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mrapp/screens/ReaderScreen/function/reader_api_func.dart';
import 'package:mrapp/screens/ReaderScreen/view/DialogBox/dialog_header.dart';
import 'package:mrapp/utils/constant.dart';
import 'package:mrapp/utils/responsive.dart';

void confirmDialogBox(context,theme,Address,addressId,previousReader,Reading) {
  final _size = MediaQuery.of(context).size;
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    // barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: Duration(milliseconds: 350),
    pageBuilder: (_, __, ___) {
      // SizeConfig().init(context);

      return Center(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: width(20),
              // _size.width * 0.07,
              vertical: height(20)
              //  _size.height * 0.02
              ),
          width: width(400),
          // _size.width * 0.9,
          height: height(250),
          //  _size.height * 0.4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Order_Dialog_Header(context),
              // Center(
              //   child: Image.asset(
              //     zSZSaimaLogo,
              //     width: _size.width* 0.4,
              //     height: _size.height * 0.1,
              //   ),
              // ),
              Material(
                color: Colors.transparent,
                child: Row(
                  children: [
                    Text("Address: ",
                        maxLines: 2,
                        style: GoogleFonts.ubuntu(
                            fontSize: height(18),
                            // _size.height * 0.03,
                            color: theme.highlightColor)),
                    Text(Address,
                        maxLines: 2,
                        style: GoogleFonts.ubuntu(
                            fontSize: height(18),
                            // _size.height * 0.03,
                            color: Colors.black)),
                  ],
                ),
              ),
              Material(
                color: Colors.transparent,
                child: Row(
                  children: [
                    Text("Meter Reading: ",
                        maxLines: 2,
                        style: GoogleFonts.ubuntu(
                            fontSize: height(18),
                            // _size.height * 0.03,
                            color: theme.highlightColor)),
                    Text("$Reading",
                        maxLines: 2,
                        style: GoogleFonts.ubuntu(
                            fontSize: height(18),
                            // _size.height * 0.03,
                            color: Colors.black)),
                  ],
                ),
              ),
              // SizedBox(
              //   height: _size.height * 0.04,
              // ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: width(168),
                        // _size.width * 0.44,
                        height: height(40),
                        margin: EdgeInsets.symmetric(vertical: height(10)),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: theme.primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(_size.width * 0.1))),
                            onPressed: () {
                              readerApi(context, theme, readerLoginIdS, addressId, previousReader, Reading);
                            },
                            child: Padding(
                              padding: EdgeInsets.all(0),
                              // _size.height * 0.01),
                              child: Text("Confirm",
                                  style: GoogleFonts.ubuntu(
                                      fontSize: width(16),
                                      color: Colors.white)),
                            )),
                      )
                    ],
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     Container(
                  //       width: width(168),
                  //       // _size.width * 0.44,
                  //       height: height(40),
                  //       // _size.height * 0.05,
                  //       // margin: EdgeInsets.symmetric(vertical: _size.height * 0.0),
                  //       child: ElevatedButton(
                  //           style: ElevatedButton.styleFrom(
                  //               primary: theme.primaryColor,
                  //               shape: RoundedRectangleBorder(
                  //                   borderRadius:
                  //                       BorderRadius.circular(_size.width * 0.1))),
                  //           onPressed: () {
                  //             Navigator.pop(context);

                  //             Order_dialog_box(context, _size.height, _size.width, theme,
                  //                 "Cash Double Tanker", "");

                  //             // Order_Swap_Detail_dialog_box(
                  //             //     context, _size.height, _size.width, theme, "Double Tanker");
                  //           },
                  //           child: Padding(
                  //             padding: EdgeInsets.all(0),
                  //             child: Center(
                  //               child: Text("Double Tanker",
                  //                   style: GoogleFonts.ubuntu(
                  //                       fontSize: width(16),
                  //                       //  _size.width * 0.042,
                  //                       color: Colors.white)),
                  //             ),
                  //           )),
                  //     )
                  //   ],
                  // )
                ],
              ),
            ],
          ),
          //  SizedBox.expand(child: FlutterLogo()),
          margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(_size.width * 0.1)),
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