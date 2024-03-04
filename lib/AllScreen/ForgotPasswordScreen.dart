
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import 'RegisterScreen.dart';
class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  var data ;

  TextEditingController forgotEmails = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: WillPopScope(
        onWillPop: ()  {
          return Future.value(true);
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 240,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(50),
                      bottomLeft: Radius.circular(50)),
                  child: Image(
                    image: AssetImage("images/login_back.webp"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    children: [
                      Center(
                        child: Text(
                          "India's #1 Fastest Food \n       Delivery App",
                          style: GoogleFonts.lexend(
                              color: Colors.black,
                              fontSize: 23,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        height: 23,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                              const EdgeInsets.only(left: 20, right: 20),
                              child: Container(
                                height: 1,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xffDAD9DD),
                                      width: 1,
                                    )),
                              ),
                            ),
                          ),
                          Text(
                            "Change Password Here",
                            style: GoogleFonts.nunito(
                                color: Color(0xff5F666D),
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                              const EdgeInsets.only(left: 20, right: 20),
                              child: Container(
                                height: 1,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xffDAD9DD),
                                      width: 1,
                                    )),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          children: [
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Color(0xffEF4F5F),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10))),
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.email,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Color(0xffe7e7e7), width: 1),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: TextFormField(
                                    onChanged: (value) {
                                      setState(() {
                                        data = value;
                                      });
                                    },
                                    autofocus: false,
                                    controller: forgotEmails,
                                    cursorColor: Color(0xff7E8286),
                                    decoration: InputDecoration(
                                      // icon: Icon(Icons.person,color:  Color(0xffEF4F5F),),
                                      hintText: "Enter Email",
                                      hintStyle: GoogleFonts.nunito(
                                        fontSize: 17,
                                        color: Color(0xff7E8286),
                                      ),
                                      border: InputBorder.none,
                                    ),
                                    style: GoogleFonts.nunito(
                                        fontSize: 17,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),



                      Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  minimumSize: MaterialStateProperty.all(
                                      Size(double.infinity, 60)),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)))),
                                  backgroundColor: MaterialStateProperty.all(
                                      Color(0xffEF505F))),
                              onPressed: () {

                                if (forgotEmails.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          behavior: SnackBarBehavior.floating,
                                          backgroundColor: Color(0xffffeeee),
                                          duration:
                                          Duration(milliseconds: 2000),
                                          elevation: 5,
                                          width: 200,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(25)),
                                          content: Center(
                                              child: Text(
                                                "Enter Email",
                                                style: TextStyle(
                                                    color: Color(0xffEF505F),
                                                    fontSize: 16),
                                              ))));
                                }
                                else if (data!=null && !RegExp(r'\S+@\S+\.\S+').hasMatch(data)) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          behavior: SnackBarBehavior.floating,
                                          backgroundColor: Color(0xffffeeee),
                                          duration:
                                          Duration(milliseconds: 2000),
                                          elevation: 5,
                                          width: 200,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(25)),
                                          content: Center(
                                              child: Text(
                                                "Invalid Email Address",
                                                style: TextStyle(
                                                    color: Color(0xffEF505F),
                                                    fontSize: 16),
                                              ))));
                                }
                                else {
                                  forgotPassword();
                                }
                              },
                              child: Text(
                                "Forgot Password",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ))),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                              const EdgeInsets.only(left: 20, right: 20),
                              child: Container(
                                height: 1,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xffDAD9DD),
                                      width: 1,
                                    )),
                              ),
                            ),
                          ),
                          Text(
                            "or",
                            style: GoogleFonts.nunito(
                                color: Color(0xff5F666D),
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                              const EdgeInsets.only(left: 20, right: 20),
                              child: Container(
                                height: 1,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xffDAD9DD),
                                      width: 1,
                                    )),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Center(
                            child: Text(
                              "By continuing, you agree to our",
                              style: GoogleFonts.nunito(
                                  fontSize: 17,
                                  color: Color(0xff595D64),
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 30, right: 30),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "Terms of Service",
                                      style: GoogleFonts.nunito(
                                          fontSize: 13,
                                          color: Color(0xff595D64),
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Container(
                                      width: 80,
                                      height: 1,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Color(0xffDAD9DD),
                                            width: 1,
                                          )),
                                    )
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  children: [
                                    Text(
                                      "Privacy Policy",
                                      style: GoogleFonts.nunito(
                                          fontSize: 13,
                                          color: Color(0xff595D64),
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Container(
                                      width: 80,
                                      height: 1,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Color(0xffDAD9DD),
                                            width: 1,
                                          )),
                                    )
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  children: [
                                    Text(
                                      "Content Policies",
                                      style: GoogleFonts.nunito(
                                          fontSize: 13,
                                          color: Color(0xff595D64),
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Container(
                                      width: 80,
                                      height: 1,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Color(0xffDAD9DD),
                                            width: 1,
                                          )),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void forgotPassword() async {
    try {
      EasyLoading.show();
      await FirebaseAuth.instance.sendPasswordResetEmail(email: forgotEmails.text);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              behavior: SnackBarBehavior.floating,
              backgroundColor: Color(0xffffeeee),
              duration:
              Duration(milliseconds: 2000),
              elevation: 5,
              width: 280,
              shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(25)),
              content: Center(
                  child: Text(
                    "We have Send Email SuccessFully",
                    style: TextStyle(
                        color: Color(0xffEF505F),
                        fontSize: 16),
                  ))));
      EasyLoading.dismiss();
     Navigator.pop(context);

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('---------------------------------)user-not-found');
        EasyLoading.dismiss();
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                behavior: SnackBarBehavior.floating,
                backgroundColor: Color(0xffffeeee),
                duration:
                Duration(milliseconds: 2000),
                elevation: 5,
                width: 180,
                shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(25)),
                content: Center(
                    child: Text(
                      "No User Found That Email",
                      style: TextStyle(
                          color: Color(0xffEF505F),
                          fontSize: 16),
                    ))));


      }
    }
  }

}
