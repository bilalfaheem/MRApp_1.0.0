
import 'package:flutter/material.dart';
import 'package:mrapp/screens/ProfileScreen/view/profile_screen.dart';
import 'package:mrapp/screens/ReaderScreen/view/reader_screen.dart';
import 'package:mrapp/utils/constant.dart';


class HomeScreen extends StatefulWidget {
 const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  final screens = [
    ReaderScreen() ,
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final _size = MediaQuery.of(context).size;
    return Scaffold(
        body: screens[currentIndex],

        //bottom bar

        bottomNavigationBar: Container(
            // height: 90,
            // _size.height * 0.08,
            decoration: const BoxDecoration(
              // color: Colors.blue,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(0), topLeft: Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black38, spreadRadius: 0, blurRadius: 10),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: BottomNavigationBar(
                // backgroundColor: Colors.amber,
                type: BottomNavigationBarType.fixed,
                currentIndex: currentIndex,
                onTap:
                    //  (index) {
                    //   if (index == 0) {
                    //     return;
                    //   } else {
                    //     setState(() {
                    //       currentIndex = index;
                    //     });
                    //   }
                    // },
                    (index) => setState(() => currentIndex = index),
                showSelectedLabels: false,
                showUnselectedLabels: false,
                selectedItemColor: theme.primaryColor,
                //unselectedItemColor: Colors.grey,
                items:
                     <BottomNavigationBarItem>
                    [
                  BottomNavigationBarItem(
                    // backgroundColor: Colors.blueGrey,
                    icon: ImageIcon(const AssetImage( gas),
                        // "assets/Bottom_Bar/Wallet.png"),
                        //color: Colors.black,
                        size: _size.height * 0.028),

                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(const AssetImage(profile),
                        size: _size.height * 0.028),
                    label: '',
                  ),
                ],
              ),
            )));
  }
}
