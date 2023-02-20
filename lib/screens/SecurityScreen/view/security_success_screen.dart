import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mrapp/utils/constant.dart';
import 'package:mrapp/utils/headingbar.dart';

class SecuritySuccessScreen extends StatelessWidget {
   SecuritySuccessScreen({super.key});

    var textsize_details = 0.027;
  var textsize = 0.06;
  var paddingsize = 0.45;
  var text_color = Colors.black;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(child: Padding(padding:EdgeInsets.fromLTRB(
                size.width * paddingHorizontal,
                size.height * paddingTop,
                size.width * paddingHorizontal,
                size.height * paddingBottom),
                child: Column(
                  children: [
                    //heading
                Container(
                    margin: EdgeInsets.only(bottom: size.height * 0.038),
                    child: headingBar(context, "Pass Detail", 20, "Back")),
                // detail box
                Container(
                    margin: EdgeInsets.only(bottom: size.height * 0.03),
                    width: size.width,
                    padding: EdgeInsets.fromLTRB(
                        size.width * 0.07,
                        size.width * 0.07,
                        size.width * 0.07,
                        size.width * 0.1),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(size.height * 0.02),
                        color: theme.dividerColor),
                    child: LayoutBuilder(builder:
                        (BuildContext context, BoxConstraints constraints) {
                      print(constraints.maxWidth.toStringAsFixed(2));
                      return Column(
                        children: [
                          Center(
                            child: Image.asset(
                              zSZSaimaLogo,
                              width: MediaQuery.of(context).size.width * 0.4,
                              height:
                                  MediaQuery.of(context).size.height * 0.055,
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: constraints.maxWidth * paddingsize,
                                margin: EdgeInsets.symmetric(
                                    vertical: size.height * 0.01),
                                // color: Colors.amber,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Name",
                                      textAlign: TextAlign.end,
                                      style: GoogleFonts.ubuntu(
                                          fontSize:
                                              constraints.maxWidth * textsize,
                                          color: text_color),
                                    ),
                                    Text(
                                      ":",
                                      textAlign: TextAlign.end,
                                      style: GoogleFonts.ubuntu(
                                          fontSize:
                                              constraints.maxWidth * textsize,
                                          // MediaQuery.of(context).size.height *
                                          //     textsize_details,
                                          color: text_color),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                // color: Colors.blue,
                                width: constraints.maxWidth * paddingsize,
                                child: Text(
                                  "Name.toUpperCase()",
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.ubuntu(
                                      fontSize:
                                          constraints.maxWidth * textsize,
                                      color: theme.focusColor),
                                ),
                              )
                            ],
                          ),
                          Divider(
                              thickness: 1, color: Color.fromARGB(75, 0, 0, 0)
                              // Colors.black,
                              ),

                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: size.height * 0.01),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  // color: Colors.amber,
                                  width: constraints.maxWidth * paddingsize,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Unit No",
                                        textAlign: TextAlign.end,
                                        style: GoogleFonts.ubuntu(
                                            fontSize: constraints.maxWidth *
                                                textsize,
                                            color: text_color),
                                      ),
                                      Text(
                                        ":",
                                        textAlign: TextAlign.end,
                                        style: GoogleFonts.ubuntu(
                                            fontSize: constraints.maxWidth *
                                                textsize,
                                            color: text_color),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  // color: Colors.blue,
                                  width: constraints.maxWidth * paddingsize,
                                  child: Text(
                                    "house_no",
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.ubuntu(
                                        fontSize:
                                            constraints.maxWidth * textsize,
                                        color: theme.focusColor),
                                  ),
                                )
                              ],
                            ),
                          ),
                          // Container(

                          Divider(
                              thickness: 1, color: Color.fromARGB(75, 0, 0, 0)),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: size.height * 0.01),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: constraints.maxWidth * paddingsize,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Order Id",
                                        textAlign: TextAlign.end,
                                        style: GoogleFonts.ubuntu(
                                            fontSize: constraints.maxWidth *
                                                textsize,
                                            color: text_color),
                                      ),
                                      Text(
                                        ":",
                                        textAlign: TextAlign.end,
                                        style: GoogleFonts.ubuntu(
                                            fontSize: constraints.maxWidth *
                                                textsize,
                                            color: text_color),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: constraints.maxWidth * paddingsize,
                                  child: Text(
                                    "order_Id",
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.ubuntu(
                                        fontSize:
                                            constraints.maxWidth * textsize,
                                        color: theme.focusColor),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            color: Color.fromARGB(75, 0, 0, 0),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: size.height * 0.01),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: constraints.maxWidth * paddingsize,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Order Status",
                                        textAlign: TextAlign.end,
                                        style: GoogleFonts.ubuntu(
                                            fontSize: constraints.maxWidth *
                                                textsize,
                                            color: text_color),
                                      ),
                                      Text(
                                        ":",
                                        textAlign: TextAlign.end,
                                        style: GoogleFonts.ubuntu(
                                            fontSize: constraints.maxWidth *
                                                textsize,
                                            color: text_color),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: constraints.maxWidth * paddingsize,
                                  child: Text(
                                    "Order_status",
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.ubuntu(
                                        fontSize:
                                            constraints.maxWidth * textsize,
                                        color: theme.focusColor),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Divider(
                              thickness: 1, color: Color.fromARGB(75, 0, 0, 0)),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: size.height * 0.01),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: constraints.maxWidth * paddingsize,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Type",
                                        textAlign: TextAlign.end,
                                        style: GoogleFonts.ubuntu(
                                            fontSize: constraints.maxWidth *
                                                textsize,
                                            color: text_color),
                                      ),
                                      Text(
                                        ":",
                                        textAlign: TextAlign.end,
                                        style: GoogleFonts.ubuntu(
                                            fontSize: constraints.maxWidth *
                                                textsize,
                                            color: text_color),
                                      ),
                                    ],
                                  ),
                                ),
                                // Expanded(
                                //   child: Container(
                                //     child: Center(
                                //       child:
                                Container(
                                  width: constraints.maxWidth * paddingsize,
                                  child: Text(
                                    "Tanker_Type",
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.ubuntu(
                                        fontSize:
                                            constraints.maxWidth * textsize,
                                        color: theme.focusColor),
                                  ),
                                ),
                                //     ),
                                //   ),
                                // )
                              ],
                            ),
                          ),
                          Divider(
                              thickness: 1, color: Color.fromARGB(75, 0, 0, 0)),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: size.height * 0.01),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: constraints.maxWidth * paddingsize,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Created Time",
                                        textAlign: TextAlign.end,
                                        style: GoogleFonts.ubuntu(
                                            fontSize: constraints.maxWidth *
                                                textsize,
                                            color: text_color),
                                      ),
                                      Text(
                                        ":",
                                        textAlign: TextAlign.end,
                                        style: GoogleFonts.ubuntu(
                                            fontSize: constraints.maxWidth *
                                                textsize,
                                            color: text_color),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: constraints.maxWidth * paddingsize,
                                  child: Text(
                                    "Time",
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.ubuntu(
                                        fontSize:
                                            constraints.maxWidth * textsize,
                                        color: theme.focusColor),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Divider(
                              thickness: 1, color: Color.fromARGB(75, 0, 0, 0)),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: size.height * 0.01),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: constraints.maxWidth * paddingsize,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Created Date",
                                        textAlign: TextAlign.end,
                                        style: GoogleFonts.ubuntu(
                                            fontSize: constraints.maxWidth *
                                                textsize,
                                            color: text_color),
                                      ),
                                      Text(
                                        ":",
                                        textAlign: TextAlign.end,
                                        style: GoogleFonts.ubuntu(
                                            fontSize: constraints.maxWidth *
                                                textsize,
                                            color: text_color),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: constraints.maxWidth * paddingsize,
                                  child: Text(
                                    "Date",
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.ubuntu(
                                        fontSize:
                                            constraints.maxWidth * textsize,
                                        color: theme.focusColor),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Divider(
                              thickness: 1, color: Color.fromARGB(75, 0, 0, 0)),
                          Container(
                            margin: EdgeInsets.only(
                                top: size.height * paddingsize),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  // color: Colors.amber,
                                  width: constraints.maxWidth * paddingsize,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Date",
                                        textAlign: TextAlign.start,
                                        style: GoogleFonts.ubuntu(
                                            fontSize: constraints.maxWidth *
                                                textsize,
                                            color: text_color),
                                      ),
                                      Text(
                                        ":",
                                        textAlign: TextAlign.end,
                                        style: GoogleFonts.ubuntu(
                                            fontSize: constraints.maxWidth *
                                                textsize,
                                            color: text_color),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: constraints.maxWidth * paddingsize,
                                  child: Text(
                                    "date"
                                    // Delivery_Time.toString() == "null" ||
                                    //         Delivery_Time == null ||
                                    //         Delivery_Time == " "
                                    //     ? " "
                                    //     : 
                                        // DateFormat.MMMEd().format(
                                        //     DateTime.parse(Delivery_Time)
                                          ,
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.ubuntu(
                                        fontSize:
                                            constraints.maxWidth * textsize,
                                        color: theme.focusColor),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      );
                    })),
              ],
            ),
                )),
    );
  }
}