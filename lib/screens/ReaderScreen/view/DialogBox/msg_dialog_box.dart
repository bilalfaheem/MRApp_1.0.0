import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mrapp/utils/constant.dart';
import 'package:mrapp/utils/responsive.dart';

void msgDialogBox(context, theme, textt, bool done) {
  final _size = MediaQuery.of(context).size;
  SizeConfig().init(context);
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 350),
    pageBuilder: (_, __, ___) {
      return Center(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: _size.width * 0.07, vertical: _size.height * 0.02),
          width: _size.width * 0.9,
          height: _size.height * 0.28,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(40)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Material(
                    color: Colors.transparent,
                    shape: const CircleBorder(),
                    clipBehavior: Clip.hardEdge,
                    //  color: theme.,
                    child: IconButton(
                        onPressed: null,
                        icon: Icon(
                          Icons.close_rounded, size: width(28),
                          color: Colors.transparent,
                          // w_size * 0.08
                        )),
                  ),

                  //  SizedBox(height: 1,),

                  Image.asset(system,
                      // color: Colors.blue,

                      width: width(180),
                      //  MediaQuery.of(context).size.width * 0.4,
                      height: height(43)
                      // MediaQuery.of(context).size.height * 0.1,
                      ),
                  Material(
                    color: Colors.transparent,
                    shape: const CircleBorder(),
                    clipBehavior: Clip.hardEdge,
                    //  color: theme.,
                    child: IconButton(
                        onPressed: null,
                        icon: Icon(
                          Icons.close_rounded, size: width(28),
                          color: Colors.transparent,
                          // w_size * 0.08
                        )),
                  ),
                ],
              ),

              //
              Container(
                margin: EdgeInsets.symmetric(vertical: _size.height * 0.02),
                child: Center(
                  child: Image.asset(
                    done ? complete : failed,
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
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      Tween<Offset> tween;
      if (anim.status == AnimationStatus.reverse) {
        tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
      } else {
        tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
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
