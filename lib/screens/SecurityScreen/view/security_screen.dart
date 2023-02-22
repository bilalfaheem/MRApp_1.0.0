import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mrapp/screens/SecurityScreen/function/security_func.dart';
import 'package:mrapp/screens/SecurityScreen/function/visitor_history_func.dart';
import 'package:mrapp/screens/SecurityScreen/widget/visitor_history_tile.dart';
import 'package:mrapp/utils/constant.dart';
import 'package:mrapp/utils/headingbar.dart';

String _scanBarcode = 'Unknown';

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({super.key});

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  Future<void> ssscanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff2c6e49', 'Cancel', true, ScanMode.QR);
      if (barcodeScanRes != "-1") {
        print("qr scannedddddddddd");
        scanApiFunc(context, barcodeScanRes.toString());
        // ScanApiFunc(context, barcodeScanRes.toString(),
        //     Credential_List.first.response!.walletId.toString());
      } else {
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => Profile2()));
      }
      print("$barcodeScanRes barcodeScannnnResult");
      print("barcodeScannnnResult");
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    // setState(() {
    //   print(
    //       "qr scannnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn Qr Scan $_scanBarcode");
    //   _scanBarcode = barcodeScanRes;
    // });
  }

  late StreamController _visitorStreamController;

  loadVisitorHistory() async {
    visitorHistoryFunc().then((res) async {
      _visitorStreamController.add(res);
      return res;
    });
  }

  Future<Null> refreshVisitorHistory() async {
    print("<<<<<<<<<<<<<<<<<<<<handle Refresh>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    visitorHistoryFunc().then((res) async {
      _visitorStreamController.add(res);
      return null;
    });
  }

  @override
  void initState() {
    super.initState();
    _visitorStreamController = StreamController();
    loadVisitorHistory();
  }

  @override
  void dispose() {
    _visitorStreamController.close();
    loadVisitorHistory().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.fromLTRB(
              size.width * paddingHorizontal,
              size.height * paddingTop,
              size.width * paddingHorizontal,
              size.height * paddingBottom),
          child: Column(
            children: [
              //heading
              Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: headingBar(context, "GatePass", 20, "null")),

              Container(
                // decoration: BoxDecoration(border: Border.all(width: 2,color: Colors.black)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        ssscanQR();
                      },
                      child: Container(
                        width: 200,
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: theme.shadowColor,
                              ),
                              child: Image.asset(
                                scanner,
                                color: theme.primaryColor,
                                height: 150,
                              ),
                            ),
                            Container(
                                width: 200,
                                margin: EdgeInsets.only(top: 20),
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: theme.shadowColor,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Scanner",
                                        style: GoogleFonts.ubuntu(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w500,
                                          color: theme.primaryColor,
                                        )),
                                  ],
                                ))
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Visitor History",
                            style: GoogleFonts.ubuntu(
                              fontSize: 19,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // >>>>>>>>>>>>>>>>>>>>>>>>>>> All Bids <<<<<<<<<<<<<<<<<<<<<
                    StreamBuilder(
                      stream: _visitorStreamController.stream,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        print('Has error: ${snapshot.hasError}');
                        print('Has data: ${snapshot.hasData}');
                        print('Snapshot Data ${snapshot.data}');
                        if (snapshot.hasError) {
                          return Text(snapshot.error.toString());
                        }
                        if (snapshot.hasData) {
                          return Container(
                              // height: size.height - 150,
                              // margin: EdgeInsets.symmetric(horizontal: 15),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    itemCount: visitorHistoryList.length,
                                    itemBuilder: (context, index) {
                                      final iteration =
                                          visitorHistoryList[index];
                                      return visitorHistoryTile(
                                          context,
                                          iteration,
                                          iteration.guest!.contactName.toString(),
                                          iteration.isScan);
                                    }),
                                SizedBox(height: 110)
                              ]));
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 150,
                                ),
                                Center(
                                    child: CircularProgressIndicator(
                                  strokeWidth: 1.5,
                                  color: theme.primaryColor,
                                ))
                              ]);
                        } else if (!snapshot.hasData &&
                            snapshot.connectionState == ConnectionState.done) {
                          return Text("No Notification");
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          )),
    )));
  }
}
