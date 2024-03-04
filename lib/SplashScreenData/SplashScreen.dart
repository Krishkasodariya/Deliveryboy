import 'dart:async';
import 'package:delivery_order/AllScreen/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../AllScreen/HomeScreen.dart';

import '../AllScreen/RegisterScreen.dart';
import '../Controller/LoginController.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

AppOpenAd? openad;

class _SplashScreenState extends State<SplashScreen> {
  LoginController loginController = Get.find();

  bool isShowingAd = false;
  bool isLoaded = false;

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    loadAd();
    loginController.Getuid();
    loginController.Getotp();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: /*isShowingAd
          ?*/ Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Color(0xffe23644),
          child: Column(
            children: [
              Spacer(),
              Spacer(),
              Text(
                "Pizza",
                style: GoogleFonts.calistoga(
                  fontSize: 50,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "100% Green Deliveries",
                style: GoogleFonts.roboto(
                    fontSize: 23,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5,
              ),
              Text("Carbon and Plastic Neutral \n                in India",
                  style: GoogleFonts.aBeeZee(
                      fontSize: 16,
                      color: Colors.white70,
                      fontWeight: FontWeight.w200)),
              Image(image: AssetImage("images/green_deliveries.webp")),
              Spacer(),
              Container(
                width: double.infinity,
                height: 200,
                child: Opacity(
                  opacity: 0.13,
                  child: Image(
                    image: AssetImage("images/tree.webp"),
                  ),
                ),
              )
            ],
          ),
        )

    );
  }

  Future chekedfirsttime() async {
    loginController.sharedPreferences = await SharedPreferences.getInstance();
    bool check = (loginController.sharedPreferences!.getBool("che") ?? false);

    if (check) {
      if (loginController.deliverBoyid.isEmpty){
        await loginController.sharedPreferences!.setBool('che', true);
        Timer(Duration(seconds: 5), () => Get.off(() => RegisterScreen()));
        print("-OpenAd-----splash----------------LoginScrren-----------------");
      } else {

        if(loginController.checkOtp==false){
          print("qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq");
          Timer(Duration(seconds: 5), () => Get.off(() => LoginScreen()));
        }else{
          Timer(Duration(seconds: 5), () => Get.off(() => HomeScreen()));
          print("--OpenAd-----splash---------------BottomNavigation-----------------");
        }

      }
    } else {
      await loginController.sharedPreferences!.setBool('che', true);
      Timer(Duration(seconds: 5), () => Get.off(() => RegisterScreen()));
    }
  }

  Future<void> loadAd() async {
    await AppOpenAd.load(
        adUnitId: "ca-app-pub-3940256099942544/9257395921",
        request: AdRequest(),
        adLoadCallback: AppOpenAdLoadCallback(
          onAdLoaded: (ad) {
            setState(() {
              openad = ad;
              isLoaded = true;
            });

            ad.fullScreenContentCallback=FullScreenContentCallback(
              onAdClicked: (ad) {
              },
              onAdDismissedFullScreenContent: (ad){
                setState(() {
                  chekedfirsttime();
                  ad.dispose();
                  isLoaded = false;
                  print("122222");
                });
              },
              onAdWillDismissFullScreenContent: (ad) {
                print("1111111111");
                ad.dispose();
                isLoaded = false;
              },
            );
            setState(() {
              openad!.show();
            });
          },
          onAdFailedToLoad: (error) {
            print("-OpenAd-$error----------ad is failed--------");
          },
        ),
        orientation: AppOpenAd.orientationPortrait);
  }


}
