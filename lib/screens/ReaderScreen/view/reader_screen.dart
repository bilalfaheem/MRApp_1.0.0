import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mrapp/screens/CameraScreen/camera.dart';
import 'package:mrapp/screens/CameraScreen/camera_screen.dart';
import 'package:mrapp/screens/ReaderScreen/function/gas_addresses.dart';
import 'package:mrapp/screens/ReaderScreen/function/reader_api_func.dart';
import 'package:mrapp/screens/ReaderScreen/provider/gas_reader_provider.dart';
import 'package:mrapp/screens/ReaderScreen/view/DialogBox/confirm_dialog_box.dart';
import 'package:mrapp/screens/ReaderScreen/view/DialogBox/loading_dialog_box.dart';
import 'package:mrapp/utils/constant.dart';
import 'package:mrapp/utils/headingbar.dart';
import 'package:mrapp/utils/logoutcheck.dart';
import 'package:mrapp/utils/responsive.dart';
import 'package:provider/provider.dart';


  var addressIdd = "null";
  var addressAddress = "null";
  var addressPreviousReading = "null";

class ReaderScreen extends StatelessWidget {
   ReaderScreen({super.key});
TextEditingController addressController = TextEditingController();
TextEditingController addressFixController = TextEditingController();
TextEditingController previousReadingController = TextEditingController();
TextEditingController newReadingController = TextEditingController();
// form key
  final GlobalKey<FormState> readerFormKey = GlobalKey<FormState>();

  //Address


  var address_Selected = false;
  bool address_Correct_variable = false;

//   void Address_Check_2() {
//     address_Correct_variable = false;

//     if (addressController.text.isEmpty) {
//       address_Correct_variable = false;
//       print("Address Controller in Empty");
//       return;
// // loop
//     } else {
//       bool for_Else = false;
//       for (var i = 0; i < Address_Swap_All_List.length; i++) {
//         print("for looppp$i");
//         if (Address_Swap_All_List[i].address.toString().toLowerCase() ==
//                 addressController.text.toString().toLowerCase() &&
//             Address_Swap_All_List[i].id == addressIdd) {
//           print(i);
//           for_Else = true;
//           address_Correct_variable = true;
//           break;
//         }
//         // else{
//         //   address_Correct_variable = false;
//         // }
//       }
//       if (for_Else == false) {
//         address_Correct_variable = false;
//       }
//     }
//   }
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final _size = MediaQuery.of(context).size;
    SizeConfig().init(context);
    logoutCheck(readerLoginIdS, context);
    
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(child: 
        Padding( 
           padding: EdgeInsets.fromLTRB(
                  _size.width * paddingHorizontal,
                  _size.height * paddingTop,
                  _size.width * paddingHorizontal,
                  _size.height * paddingBottom),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //heading
                  Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, _size.height * 0.038),
                      child: headingBar(context, "Gas Reading", 22, "null")),
      
                  Consumer<GasReaderProvider>(
                    builder: (context,value,child) {
                      return 
                      value.addressSearching?
      //Search Address              
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  " Enter Address",
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.ubuntu(
                                  fontSize: _size.height*0.02,
                                  color: theme.primaryColor,
                                  
                                )),
                              
                            Container(
                            margin: EdgeInsets.only(bottom: _size.height * 0.02,top: _size.height*0.008),
                                padding: EdgeInsets.symmetric(
                                    horizontal: _size.width * 0.04, vertical: _size.width * 0.01),
                                // all(_size.width * 0.01),
                                height: _size.height * 0.08,
                                width: _size.width / 1.2,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(_size.width * 0.1),
                                     border: Border.all(color:theme.primaryColor),
                                    color: theme.dividerColor),
                                child: Center(
                                  child: TypeAheadFormField<GasAddress?>(
                                    hideSuggestionsOnKeyboardHide: false,
      
                                    debounceDuration: Duration(milliseconds: 500),
      
                                    textFieldConfiguration: TextFieldConfiguration(
                                        cursorColor: theme.primaryColor,
                                        controller: addressController,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.transparent,
                                          // fillColor: theme.dividerColor,
                                          border: InputBorder.none,
                                          hintText: "Address",
                                          // focusColor: Colors.transparent,
                                          focusColor: theme.primaryColor,
                                        )),
      
                                    // // api function
      
                                    suggestionsCallback:
                                        GasAddress_Api.getAddressSuggestions,
                                    itemBuilder:
                                        (context, GasAddress? suggestion) {
                                      // ScrollBehavior:
                                      final addr_s = suggestion!;
                                      return ListTile(
                                        title: Text(addr_s.address),
                                      );
                                    },
                                    //on loading
                                    loadingBuilder: (context) => Container(
                                      height: _size.height * 0.1,
                                      child: const Center(
                                        child: CircularProgressIndicator(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    // on selection
                                    onSuggestionSelected:
                                        (GasAddress? suggestion) {
                                      final addr_s = suggestion!;
      
                                      addressIdd = addr_s.id;
                                      addressAddress = addr_s.address;
                                      addressPreviousReading = addr_s.previousreading;
                                      address_Selected = true;
                                      
                                      //initialize text field readonly values
                                      addressController.text =addr_s.address.toString();
                                      addressFixController.text = addr_s.address;
                                      previousReadingController.text = addr_s.previousreading;
                                      value.addressSearchingFunc(false);
      
                                      print(addr_s.previousreading.toString());
                                      print(addr_s.address.toString());
                                      print(addr_s.id.toString());
      
                                      // print("${addressIdd} swap to id in swap variable");
                                      // print(
                                      //     "${addressAddress.toLowerCase()} swap to address in swap variable");
      
                                      // print(addr_s.address);
                                      // print(addr_s.id);
                                    },
                                    //No item Found
                                    noItemsFoundBuilder: (context) => Container(
                                      height: _size.height * 0.1,
                                      child: const Center(
                                        child: Text("No Address Found"),
                                      ),
                                    ),
      
                                    //error
      
                                    hideOnError: true,
      
                                    // validator: (value) {
                                    //   if (value == null || value.isEmpty) {
                                    //     return "Please Enter Address";
                                    //   } else if (address_Selected == true) {
                                    //     print("Select tile true");
                                    //     if (address_Correct_variable == true) {
                                    //       print("address Correct");
                                    //       return null;
                                    //     } else if (address_Correct_variable ==
                                    //         false) {
                                    //       print("address Wrong");
                                    //       return "Enter Address Correctly";
                                    //     }
                                    //   } else if (address_Selected == false) {
                                    //     return "Select an Address from List";
                                    //   } else {
                                    //     return "wrong";
                                    //   }
                                    // },
                                  ),
                                ),
                              )],
                            ):
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
      //Address              
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "      Address",
                                  // textAlign: TextAlign.start,
                                  style: GoogleFonts.ubuntu(
                                  fontSize: _size.height*0.02,
                                  color: theme.primaryColor,
                                  
                                ),),
                              ],
                            ),
                            Container(
                            margin: EdgeInsets.only(bottom: _size.height * 0.02,top: _size.height*0.008),
                                padding: EdgeInsets.symmetric(
                                    horizontal: _size.width * 0.04, vertical: _size.width * 0.01),
                                // all(_size.width * 0.01),
                                height: _size.height * 0.08,
                                width: _size.width / 1.2,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(_size.width * 0.1),
                                    //  border: value.addressSearching? Border.all(color: Colors.black):Border.all(color: Colors.transparent),
                                    color: theme.dividerColor),
                                child: Center(
                                  child: TextFormField(
                                    controller: addressFixController,
                                    readOnly: true,
                                    decoration:   InputDecoration(
                                      border: InputBorder.none,
                                      filled: true,
                                      fillColor: Colors.transparent,
                                      suffixIcon:IconButton(
                                        onPressed: (){
                                          value.addressSearchingFunc(true);
                                          print("close pressed");}, 
                                        icon: Icon(Icons.close,color: theme.primaryColor,),) 
                                      
      
                                    ),
                                  ),
                                ),
                              ),
        //Previous Reading              
                            Row(
                              children: [
                                Text(
                                  "      Previous Reading",
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.ubuntu(
                                  fontSize: _size.height*0.02,
                                  color: theme.primaryColor,
                                  
                                ),),
                              ],
                            ),
                            Container(
                            margin: EdgeInsets.only(bottom: _size.height * 0.02,top: _size.height*0.008),
                            padding: EdgeInsets.symmetric(
                                horizontal: _size.width * 0.04, vertical: _size.width * 0.01),
                            // all(_size.width * 0.01),
                            height: _size.height * 0.08,
                            width: _size.width / 1.2,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(_size.width * 0.1),
                                color: theme.dividerColor),
                            child: Center(
                              child: TextFormField(
                                    controller: previousReadingController,
                                    readOnly: true,
                                    decoration:  const InputDecoration(
                                      border: InputBorder.none,
                                      filled: true,
                                      fillColor: Colors.transparent,
                                     
                                    ),
                                  ))),
      //new Reading             
                            Row(
                              children: [
                                Text(
                                  "      New Reading",
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.ubuntu(
                                  fontSize: _size.height*0.02,
                                  color: theme.primaryColor,
                                  
                                ),),
                              ],
                            ),
                            Container(
                            margin: EdgeInsets.only(bottom: _size.height * 0.02,top: _size.height*0.008),
                            padding: EdgeInsets.symmetric(
                                horizontal: _size.width * 0.04, vertical: _size.width * 0.01),
                            // all(_size.width * 0.01),
                            height: _size.height * 0.08,
                            width: _size.width / 1.2,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(_size.width * 0.1),
                                 border:  Border.all(color: theme.primaryColor,width: 1),
                                color: theme.dividerColor),
                            child: Center(
                              child: Form(
                                key: readerFormKey,
                                child: TextFormField(
                                      controller: newReadingController,
                                      cursorColor: theme.primaryColor,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                      decoration:   InputDecoration(
                                        border: InputBorder.none,
                                        filled: true,
                                        fillColor: Colors.transparent,
                                        suffixIcon:IconButton(
                                          onPressed: (){
                                            newReadingController.clear();
                                            print("clear pressed");}, 
                                          icon: Icon(Icons.close,color: theme.primaryColor,),) 
                                      ),
                                      validator: (value){
                                        if(value == null ||value.isEmpty|| value.length<6 || value.length>8 ){
                                          return "Enter Correct Reading";
                                        }
                                      },
                                    ),
                              ))),
      // Add Reading Button                                
                               Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   Container(
                              margin:
                                      EdgeInsets.only(top: height(50), bottom: height(20)),
                              height: height(48),
                              width: width(220),
                              decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      
                                      ),
                              child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: theme.primaryColor,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(30))),
                                      onPressed: () async{
                                        await availableCameras().then((value) => Navigator.push(context, MaterialPageRoute(builder: (_) => CameraPage(cameras: value))));

                                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>CameraPage(cameras: cameras)));
                                      //    if (!readerFormKey.currentState!.validate()) {return;}
                                      //     confirmDialogBox(context, theme, addressAddress, addressIdd, addressPreviousReading, newReadingController.text);
                                       },
                          child: LayoutBuilder(builder:
                              (BuildContext context, BoxConstraints constraints) {
                            return Text(
                                    // constraints.maxWidth.toStringAsFixed(2),
                                    "Add Reading",
                                    style: GoogleFonts.ubuntu(
                                        fontSize: constraints.maxHeight * 0.44,
                                        // width(30),
                                        // MediaQuery.of(context).size.height * 0.04,
                                        color: theme.cardColor));
                          }))),
                                 ],
                               ),
                                  ],
                      );
                    }
                  ),
               
              ],
            ),
              
        )
        ),
      )
    );
  }
}