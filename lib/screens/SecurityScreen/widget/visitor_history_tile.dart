import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mrapp/screens/ReaderScreen/view/DialogBox/msg_dialog_box.dart';
import 'package:mrapp/screens/SecurityScreen/view/security_success_screen.dart';
import 'package:mrapp/utils/constant.dart';

Widget visitorHistoryTile(context, iteration, complainType, date) {
  final size = MediaQuery.of(context).size;
  final theme = Theme.of(context);
  return GestureDetector(
    // onHorizontalDragEnd: (details) => print(details),
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SecuritySuccessScreen(
                  name: iteration.guest!.contactName.toString(),
                  unitNo: iteration.passess!.address.toString(),
                  eventType: iteration.passess!.passEvent.toString(),
                  passType: iteration.passess!.passType.toString(),
                  validTill: iteration.passess!.endDate.toString())));
      // // print(threadId);
    },
    child: Container(
        margin: EdgeInsets.only(bottom: 12),
        child: ListTile(
          horizontalTitleGap: 15,
          selected: false,
          // contentPadding: EdgeInsets.symmetric(
          //     horizontal: size.width * 0.05, vertical: size.width * 0.01),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          tileColor: theme.shadowColor,
          leading: Container(
            // margin: EdgeInsets.fromLTRB(size.width * 0.03,
            //     size.width * 0.027, size.width * 0.1, size.width * 0.027),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: complainType == "tanker"
                    ? theme.primaryColor
                    :
                    //  Color.fromARGB(190, 20, 72, 111):
                    complainType == "maintenance"
                        ? Color.fromARGB(191, 238, 62, 49)
                        : complainType == "regular" || complainType == "general"
                            ? Colors.white
                            :
                            // Color.fromARGB(198, 87, 24, 98):
                            theme.primaryColor,

                // Paid
                //     ? Color.fromARGB(203, 210, 4, 45)
                //     : Color.fromARGB(240, 20, 72, 111),
                // Color.fromARGB(240, 20, 72, 111),
                // Color.fromARGB(255, 228, 114, 106),
                shape: BoxShape.circle),
            child: Image.asset(
              ticket,
              // complainType == "tanker"
              //     ? "assets/Icons/Tanker.png"
              //     : complainType == "maintenance"
              //         ? "assets/Icons/Warning.png"
              //         : complainType == "regular"
              //             ? "assets/Logo_app.png"
              //             : complainType == "general"
              //                 ? "assets/Logo_app.png"
              //                 : "assets/Icons/Warning.png",
              color: complainType == "regular"
                  ? theme.primaryColor
                  : complainType == "general"
                      ? Colors.red
                      : Colors.white,
              height: 20,
              fit: BoxFit.fill,
            ),
          ),
          title: Text(
              complainType[0].toUpperCase() +
                  complainType.substring(1).toLowerCase(),
              style: GoogleFonts.ubuntu(fontSize: 15.5, color: Colors.black)),
          subtitle: Container(
            margin: EdgeInsets.only(top: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Text("Scan at:",
                          style: GoogleFonts.ubuntu(
                              fontSize: 13, color: Colors.black)),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                      decoration: BoxDecoration(
                          // color: Colors.purple,
                          borderRadius: BorderRadius.circular(30)),
                      child: Text(
                          DateFormat.MMMEd().format(DateTime.parse(date)),
                          style: GoogleFonts.ubuntu(
                              fontSize: 14, color: theme.highlightColor)),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 3),
                      child: Text("|",
                          style: GoogleFonts.ubuntu(
                              fontSize: 14, color: theme.highlightColor)),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                      decoration: BoxDecoration(
                          // color: Colors.purple,
                          borderRadius: BorderRadius.circular(30)),
                      child: Text(DateFormat.jm().format(DateTime.parse(date)),
                          style: GoogleFonts.ubuntu(
                              fontSize: 14, color: theme.highlightColor)),
                    )
                  ],
                ),
                // Container(
                //   margin: EdgeInsets.only(top: size.width * 0.01),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children: [
                //       Text(
                //           // DateFormat.yMMMd()
                //           //                       .format(DateTime.parse("$date 00:00:00")),
                //           "date",
                //           style: GoogleFonts.ubuntu(
                //               fontSize: size.height * 0.02, color: Colors.black))
                //     ],
                //   ),
                // )
              ],
            ),
          ),
          // trailing: Row(
          //   mainAxisSize: MainAxisSize.min,
          //   children: [
          //     Container(
          //       // color: Colors.amber,
          //       child: Icon(
          //         Icons.arrow_forward_ios,
          //         color: theme.primaryColor,
          //       ),
          //     ),
          //   ],
          // ),
        )),
  );
}
