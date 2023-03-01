import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mrapp/screens/ProfileScreen/util/profile_tile.dart';
import 'package:mrapp/utils/constant.dart';
import 'package:mrapp/utils/headingbar.dart';
import 'package:mrapp/utils/loading.dart';
import 'package:mrapp/utils/logout.dart';
import 'package:mrapp/utils/logoutcheck.dart';
import 'package:mrapp/utils/responsive.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final _size = MediaQuery.of(context).size;
    SizeConfig().init(context);
     logoutCheck(context, readerLoginIdS, readerLoginUpdateS);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
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
                    child: headingBar(context, "Profile", 22, "null")),
                // IconButton(onPressed: (){

                // }, icon: Icon(Icons.menu)),

                //profile image

                Center(
                    child: CircleAvatar(
                  backgroundColor: theme.primaryColorDark,
                  radius: _size.height * 0.08,

                  // backgroundImage: AssetImage("assets/Bottom_Bar/Profile.png"),
                  child: Container(
                    // margin: EdgeInsets.symmetric(vertical: 100),
                    // color: Colors.amber,
                    // height: _size.height*1,
                    child: Image.asset(
                      zSZSaimaLogo, width: _size.height * 0.134,
                      color: Colors.white,
                      // width: _size.width * 0.5,
                    ),
                  ),
                )),
                profileTile(
                    _size,
                    theme,
                    readerLoginNameS.toString().toUpperCase(),
                    readerLoginCnicS,
                    readerLoginPhoneS,
                    readerLoginSocietyS),
                // StreamBuilder(
                //     stream:
                //         Active_User_Func(User_Login_id_S.toString(), context)
                //             .asStream(),
                //     builder: (context, snapshot) {
                //       if (snapshot.connectionState == ConnectionState.waiting) {
                //         return profileTile(
                //             _size,
                //             theme,
                //             User_Login_name_S.toString().toUpperCase(),
                //             "....",
                //             ".....",
                //             "$User_Login_Address_S",
                //             "$User_Login_Society_S");
                //       } else if (snapshot.hasData) {
                //         return Profile_Tile(
                //             _size,
                //             theme,
                //             Active_User_List[0]
                //                 .fullName
                //                 .toString()
                //                 .toUpperCase(),
                //             User_login_Cnic,
                //             // Active_User_List[0].ownerCnic.toString(),
                //             Active_User_List[0].contact.toString(),
                //             Active_User_List[0].address.toString(),
                //             "$User_Login_Society_S");
                //       } else {
                //         return Profile_Tile(_size, theme, ".....", ".....",
                //             ".....", ".....", "......");
                //       }
                //     }),

                // //Log Out
                // Container(
                //     height: MediaQuery.of(context).size.height * 0.07,
                //     width: MediaQuery.of(context).size.width * 0.7,
                //     margin: EdgeInsets.fromLTRB(
                //         0, _size.height * 0.05, 0, _size.height * 0.08),
                //     decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(100),
                //         color: Colors.amber),
                //     child: ElevatedButton(
                //         style: ElevatedButton.styleFrom(
                //             primary: theme.primaryColor,
                //             shape: RoundedRectangleBorder(
                //                 borderRadius: BorderRadius.circular(30))),
                //         onPressed: () {
                //           Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //                 builder: (context) => Setting_screen()),
                //           );
                //         },
                //         child: Text("Settings",
                //             style: GoogleFonts.ubuntu(
                //                 fontSize:
                //                     MediaQuery.of(context).size.height * 0.04,
                //                 color: Colors.white)))),
                Container(
                    margin:
                        EdgeInsets.only(top: height(50), bottom: height(20)),
                    height: height(48),
                    width: width(220),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.amber),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: theme.primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        onPressed: () {
                          loadingIndicator(context);
                          logOut(context, true);
                          // logoutCheck(readerLoginIdS, context);
                        },
                        child: LayoutBuilder(builder:
                            (BuildContext context, BoxConstraints constraints) {
                          return Text(
                              // constraints.maxWidth.toStringAsFixed(2),
                              "Logout",
                              style: GoogleFonts.ubuntu(
                                  fontSize: constraints.maxHeight * 0.44,
                                  // width(30),
                                  // MediaQuery.of(context).size.height * 0.04,
                                  color: theme.cardColor));
                        }))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
