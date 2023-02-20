import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mrapp/screens/SecurityScreen/function/security_func.dart';
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
            '#ff011f4b', 'Cancel', true, ScanMode.QR);
        if (barcodeScanRes != "-1") {
          print("qr scanned");
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

      setState(() {
        print(
            "qr scannnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn Qr Scan $_scanBarcode");
        _scanBarcode = barcodeScanRes;
      });
    }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: 
      Padding( 
         padding: EdgeInsets.fromLTRB(
                size.width * paddingHorizontal,
                size.height * paddingTop,
                size.width * paddingHorizontal,
                size.height * paddingBottom),
          child:Column(
            
            children: [
              //heading
                Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, size.height * 0.038),
                    child: headingBar(context, "GatePass", 20, "null")
                    ),
      
                    Expanded(
                      flex: 1,
                      child: Container(
                        // decoration: BoxDecoration(border: Border.all(width: 2,color: Colors.black)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: (){
                                ssscanQR();
                              },
                              child: Container(
                                width: 250,
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),
                                      color: theme.shadowColor,
                                      ),
                                      child: Image.asset(scanner,color: theme.primaryColor,height: 200,),
                                    ),
                                  
                                Container(
                                  width: 250,
                                  margin: EdgeInsets.only(top: 20),
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                                  color: theme.shadowColor,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Scanner",
                                      style: GoogleFonts.ubuntu(
                                                fontSize:22,
                                                fontWeight: FontWeight.w500,
                                                color: theme.primaryColor,
                                                
                                              )
                                ),
                                    ],
                                  ))
                                ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
            ],
          )
        )));
  }
}