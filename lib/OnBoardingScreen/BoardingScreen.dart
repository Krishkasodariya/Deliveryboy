import 'package:delivery_order/OnBoardingScreen/FirstPage.dart';
import 'package:delivery_order/OnBoardingScreen/SecondPage.dart';
import 'package:delivery_order/OnBoardingScreen/ThirdPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../SplashScreenData/SplashScreen.dart';

class BoardingScreen extends StatefulWidget {
  const BoardingScreen({super.key});

  @override
  State<BoardingScreen> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  List boardinglist = [FirstPage(), SecondPage(), ThirdPage()];

  PageController pageController = new PageController();
  int pindex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: PageView.builder(
              controller: pageController,
              itemCount: boardinglist.length,
              onPageChanged: (value) {
                setState(() {
                  pindex = value;

                  if (pindex == 2) {
                    Future.delayed(Duration(seconds: 3)).then((value){
                      Get.off(SplashScreen());
                      print("object");
                    });

                  }

                });
              },
              itemBuilder: (context, index) {
                return Container(
                  child: boardinglist[index],
                );
              },
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child:  Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: SmoothPageIndicator(
                controller: pageController,
                count: boardinglist.length,
                effect: JumpingDotEffect(
                  activeDotColor: Color(0xffEF4F5F),
                  dotWidth: 8,
                  dotHeight: 8,
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
