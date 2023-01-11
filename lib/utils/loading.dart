import 'package:flutter/material.dart';

void loadingIndicator(context) {
  showDialog(
      context: context,
      barrierColor: const Color.fromARGB(41, 0, 0, 0),
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Dialog(
            elevation: 0,
            backgroundColor: Color.fromARGB(0, 0, 0, 0),
            child: Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            ));
      });
}
