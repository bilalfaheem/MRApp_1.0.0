import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mrapp/screens/HomeScreen/view/home_screen.dart';
import 'package:mrapp/screens/LoginScreen/provider/login_password_provider.dart';
import 'package:mrapp/screens/LoginScreen/view/login_screen.dart';
import 'package:mrapp/screens/ProfileScreen/view/profile_screen.dart';
import 'package:mrapp/theme/theme.dart';
import 'package:mrapp/utils/constant.dart';
import 'package:mrapp/utils/sharedpref.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sharedPrefLoginFunc();
  SystemChrome.setPreferredOrientations([
  DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginPasswordProvider()),
       
      ],
      child: Builder(builder: (BuildContext context) {
        print(readerLoginIdS);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: 
          readerLoginIdS == "null"?
          LoginScreen():HomeScreen(),
          // User_Login_id_S == "null" ? Splash_Screen() : Home_Screen(),

          theme: CustomTheme.lightTheme,
          darkTheme: CustomTheme.darkTheme,
          themeMode: currentTheme.currentTheme,
        );
      }),
    );
  }
}