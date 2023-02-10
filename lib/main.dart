// import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
// import 'package:protest/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:protest/LocalString.dart';
import 'package:protest/colors.dart';
import 'package:protest/login_page.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // var isAmharic = prefs.getBool('isAmharic') ?? false;
  // var isOromiffa = prefs.getBool('isOromiffa') ?? false;
  // print(isOromiffa);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(brightness: Brightness.light),
      translations: LocaleString(),
      // (foo==1)? something1():(foo==2)? something2(): something3();
      locale: Locale('en', 'US'),

      // if (isAmharic){
      //   locale: Locale('am','ET'),
      // }else if(isOromiffa){
      //   locale: Locale('or','ET'),
      // }else{
      //   locale: Locale('en', 'US'),
      // }
      // locale: Locale('en', 'US'),
      // darkTheme: MyTheme().darkTheme,
      title: 'CooPlay',
      home: AnimatedSplashScreen(
          duration: 1000,
          splash: Icons.games_outlined,
          nextScreen: Login_page(),
          splashTransition: SplashTransition.rotationTransition,
          // pageTransitionType: PageTransitionType.scale,
          backgroundColor: Colors_selector.primmary1),
      debugShowCheckedModeBanner: false,

      // home: HomePage(),
    );
  }
}
