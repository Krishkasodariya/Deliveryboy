import 'package:delivery_order/Controller/LoginController.dart';
import 'package:delivery_order/OnBoardingScreen/ThirdPage.dart';
import 'package:delivery_order/SplashScreenData/SplashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'OnBoardingScreen/BoardingScreen.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await MobileAds.instance.initialize();
  Get.put(LoginController());
  configLoading();
  runApp(GetMaterialApp(
    builder: EasyLoading.init(),
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..userInteractions = true
    ..dismissOnTap = false;
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  LoginController loginController=Get.find();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return FutureBuilder(
          future: chekedfirsttime(),
          builder: (context, snapshot) {
            return Container();
          },
        );
      },
    );
  }

  Future chekedfirsttime() async {
    loginController.sharedPreferences = await SharedPreferences.getInstance();
    bool check = (loginController.sharedPreferences!.getBool("check") ?? false);
    if (check) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => SplashScreen()));
      //splashScreen
    } else {
      await loginController.sharedPreferences!.setBool('check', true);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => BoardingScreen()));
      //BoardingScreen
    }
  }
}
