import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mrapp/utils/responsive.dart';

Widget headingBar(context, heading, double headingSize, iconName) {
  SizeConfig().init(context);
  final ThemeData theme = Theme.of(context);
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      IconButton(
          onPressed: iconName == "Close" || iconName == "Back"
              ? () {
                  Navigator.pop(context);
                }
              : null,
          icon: iconName == "Close"
              ? Image.asset(
                  "assets/Icons/close.png",
                  height: height(14),
                  color: theme.primaryColor,
                )
              : iconName == "Back"
                  ? Icon(
                      Icons.arrow_back_ios,
                      size: height(20),
                    )
                  : Icon(
                      Icons.arrow_back_ios,
                      size: height(20),
                      color: Colors.transparent,
                    ),
          color: theme.primaryColor),
      // SizedBox(width: _size.width * 0.205),
      Center(
        child: Text(
          heading,
          style: GoogleFonts.ubuntu(
              fontSize: height(headingSize), color: theme.focusColor),
        ),
      ),
      IconButton(
          onPressed: null,
          icon: iconName == "Close"
              ? Image.asset(
                  "assets/Icons/close.png",
                  height: height(14),
                  color: Colors.transparent,
                )
              : iconName == "Back"
                  ? Icon(
                      Icons.arrow_back_ios,
                      color: Colors.transparent,
                      size: height(20),
                    )
                  : Icon(
                      Icons.arrow_back_ios,
                      color: Colors.transparent,
                      size: height(20),
                    ),
          color: Colors.transparent),
    ],
  );
}
