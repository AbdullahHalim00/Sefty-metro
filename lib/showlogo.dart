//AnimatedSplashScreen
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'core/network/dio.dart';
import 'main.dart';
Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await DioHelperPayment.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: g,
        ),
        title: 'Safety Metro',
        home: AnimatedSplashScreen(
            duration: 2500,
            splash: "assets/icon/icon.png",
            nextScreen: appy(),
            splashTransition: SplashTransition.sizeTransition,
            pageTransitionType: PageTransitionType.bottomToTop,
            backgroundColor: Colors.grey));
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.redAccent,
      child: Text("Safety Metro"),
    );
  }
}