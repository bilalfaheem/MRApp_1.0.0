import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:mrapp/screens/ReaderScreen/function/gas_addresses.dart';
import 'package:mrapp/utils/constant.dart';
import 'package:mrapp/utils/headingbar.dart';
import 'package:mrapp/utils/logoutcheck.dart';
import 'package:mrapp/utils/responsive.dart';

class ReaderScreen extends StatelessWidget {
   ReaderScreen({super.key});
TextEditingController addressController = TextEditingController();
// form key
  final GlobalKey<FormState> _Swap_formKey = GlobalKey<FormState>();

  //Address

  var swap_to_Id = "null";
  var swap_to_Address = "null";
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
//             Address_Swap_All_List[i].id == swap_to_Id) {
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
      body: SafeArea(child: 
      Padding( 
         padding: EdgeInsets.fromLTRB(
                _size.width * paddingHorizontal,
                _size.height * paddingTop,
                _size.width * paddingHorizontal,
                _size.height * paddingBottom),
          child: Column(
            children: [
              //heading
                Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, _size.height * 0.038),
                    child: headingBar(context, "Gas Reading", 22, "null")),
                Container(
                      margin: EdgeInsets.only(top: _size.height * 0.02),
                      padding: EdgeInsets.symmetric(
                          horizontal: _size.width * 0.04, vertical: _size.width * 0.01),
                      // all(_size.width * 0.01),
                      height: _size.height * 0.08,
                      width: _size.width / 1.2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(_size.width * 0.1),
                          color: theme.dividerColor),
                      child: Visibility(
                        visible: true,
                        child: Center(
                          child: Form(
                            key: _Swap_formKey,
                            child: Material(
                              color: Colors.transparent,
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
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                // on selection
                                onSuggestionSelected:
                                    (GasAddress? suggestion) {
                                  final addr_s = suggestion!;
                                  addressController.text =
                                      addr_s.address.toString();
                                  swap_to_Id = addr_s.id;
                                  swap_to_Address = addr_s.address;
                                  address_Selected = true;

                                  print(addr_s.previousreading.toString());
                                  print(addr_s.address.toString());
                                  print(addr_s.id.toString());

                                  // print("${swap_to_Id} swap to id in swap variable");
                                  // print(
                                  //     "${swap_to_Address.toLowerCase()} swap to address in swap variable");

                                  // print(addr_s.address);
                                  // print(addr_s.id);
                                },
                                //No item Found
                                noItemsFoundBuilder: (context) => Container(
                                  height: _size.height * 0.1,
                                  child: Center(
                                    child: Text("No Address Found"),
                                  ),
                                ),

                                //error

                                hideOnError: true,

                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please Enter Address";
                                  } else if (address_Selected == true) {
                                    print("Select tile true");
                                    if (address_Correct_variable == true) {
                                      print("address Correct");
                                      return null;
                                    } else if (address_Correct_variable ==
                                        false) {
                                      print("address Wrong");
                                      return "Enter Address Correctly";
                                    }
                                  } else if (address_Selected == false) {
                                    return "Select an Address from List";
                                  } else {
                                    return "wrong";
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
            ],
          ),
            
      )
      )
    );
  }
}