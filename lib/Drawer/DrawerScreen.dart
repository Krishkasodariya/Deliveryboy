import 'package:delivery_order/Controller/LoginController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import '../AllScreen/LoginScreen.dart';
import 'ProfileScreen.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  LoginController logincontroller=Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    logincontroller.Getuid();
    logincontroller.profileData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xffEF4F5F),
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context,);
            setState(() {});
          },
          child: Icon(
            Icons.arrow_back_rounded,
            size: 25,
            color: Colors.white,
          ),
        ),
        title: Text("DrawerScreen",
            style: GoogleFonts.nunito(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500)),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Container(
                width: double.infinity,
                height: 110,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xffE9E9F7),
                          blurRadius: 10,
                          spreadRadius: 4)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Spacer(),
                          Text("${logincontroller.addname.text}",
                              style: GoogleFonts.lexend(
                                  color: Colors.black,
                                  fontSize: 23,
                                  fontWeight: FontWeight.w500)),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("View activity",
                                  style: GoogleFonts.lexend(
                                      color: Color(0xffEF4F5F),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400)),
                              Icon(
                                Icons.play_arrow_rounded,
                                color: Color(0xffEF4F5F),
                                size: 15,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                      Spacer(),
                      Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      child: ProfileScreen()));
                              setState(() {
                                logincontroller.changeColor = false;

                              });
                            },
                            child: Container(
                              width: 85,
                              height: 85,
                              decoration: BoxDecoration(
                                  color: Color(0xffE9E9F7),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Color(0xffEF4F5F),
                                    width: 2,
                                  )),
                              child: Center(
                                child: logincontroller.imageurl.isEmpty
                                    ? Container(
                                    width: 110,
                                    height: 110,
                                    decoration: BoxDecoration(
                                      color: Color(0xffE9E9F7),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.person,
                                      color: Color(0xffB1BBDA),
                                      size: 60,
                                    ))
                                    : ClipRRect(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(60)),
                                  child: Container(
                                      width: 110,
                                      height: 110,
                                      decoration: BoxDecoration(
                                        color: Color(0xffE9E9F7),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image(
                                        image: NetworkImage(
                                            logincontroller.imageurl),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                              top: 65,
                              left: 15,
                              child: Container(
                                  width: 50,
                                  height: 23,
                                  decoration: BoxDecoration(
                                      color: Color(0xffEF4F5F),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                      border: Border.all(
                                          color: Color(0xffFEF1F3), width: 3)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Row(
                                      children: [
                                        Text("32%",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400)),
                                        Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          size: 10,
                                          color: Colors.white,
                                        )
                                      ],
                                    ),
                                  )))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xffE9E9F7),
                          blurRadius: 10,
                          spreadRadius: 4)
                    ]),

                child: Column(
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 4,
                          height: 30,
                          decoration: BoxDecoration(
                              color: Color(0xffEF4F5F),
                              borderRadius:
                              BorderRadius.all(Radius.circular(5))),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Center(
                          child: Text(
                            "More",
                            style: GoogleFonts.lexend(
                                color: Colors.black,
                                fontSize: 21,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            logincontroller.logout();
                            Get.off(LoginScreen());
                          });
                        },
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 36,
                                  height: 36,
                                  decoration: BoxDecoration(
                                      color: Color(0xffF2F4F7),
                                      shape: BoxShape.circle),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.5),
                                    child: Image(
                                        image: AssetImage(
                                            "images/logout.webp"),
                                        color: Color(0xff787E91)),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Logout",
                                  style: GoogleFonts.nunito(
                                      fontSize: 18,
                                      color: Color(0xff313848),
                                      fontWeight: FontWeight.w600),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xff313848),
                                  size: 17,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 60),
                              child: Container(
                                width: double.infinity,
                                height: 1,
                                decoration: BoxDecoration(
                                    border: Border.symmetric(
                                        horizontal: BorderSide(
                                            color: Color(0xffEAEDF3),
                                            width: 1.5))),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
