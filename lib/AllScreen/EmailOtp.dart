import 'package:delivery_order/AllScreen/HomeScreen.dart';
import 'package:delivery_order/AllScreen/LoginScreen.dart';
import 'package:delivery_order/Controller/LoginController.dart';
import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'AddProfile.dart';
class EmailOtp extends StatefulWidget {
  String email;
   EmailOtp({super.key,required this.email});

  @override
  State<EmailOtp> createState() => _EmailOtpState();
}

class _EmailOtpState extends State<EmailOtp> {

  LoginController logincontroller=Get.find();
  var data;
  EmailOTP emailOtp = EmailOTP();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sendOtp();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: WillPopScope(
        onWillPop: (){
          return Future.value(false);
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
                            "Varify Otp Here",
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
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Pinput(
                          pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                          showCursor: true,
                          length: 6,
                          animationDuration: Duration(milliseconds: 300),
                          androidSmsAutofillMethod:
                          AndroidSmsAutofillMethod.none,
                          closeKeyboardWhenCompleted: true,
                          defaultPinTheme: PinTheme(
                              width: 55,
                              height: 55,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Color(0xffDAD9DD), width: 1),
                                  borderRadius: BorderRadius.all(Radius.circular(15))),
                              textStyle:
                              TextStyle(color: Color(0xff293041), fontSize: 17)),
                          focusedPinTheme: PinTheme(
                              width: 55,
                              height: 55,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Color(0xff293041), width: 1),
                                  borderRadius: BorderRadius.all(Radius.circular(15))),
                              textStyle:
                              TextStyle(color: Color(0xff293041), fontSize: 17)),
                          onCompleted: (value) {
                            data = value;
                          },
                        ),
                      ),

                      SizedBox(
                        height: 15,
                      ),

                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                              onPressed: () {
                                sendOtp();
                              },
                              child: Text("Re sendOtp?",
                                style: GoogleFonts.nunito(
                                    fontSize: 17,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w500),
                              )),
                        ),
                      ),

                      SizedBox(
                        height: 15,
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
                                varifyOtp();
                              },
                              child: Text(
                                "Enter Otp",
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

  void varifyOtp() async {
    var inputOTP =data;
    if (await emailOtp.verifyOTP(otp: inputOTP) == true) {

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              behavior: SnackBarBehavior.floating,
              backgroundColor: Color(0xffffeeee),
              duration:
              Duration(milliseconds: 2000),
              elevation: 5,
              width: 150,
              shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(25)),
              content: Center(
                  child: Text(
                    "Verify Otp",
                    style: TextStyle(
                        color: Color(0xffEF505F),
                        fontSize: 16),
                  ))));

      var otp= emailOtp.verifyOTP(otp: inputOTP) == true;
      logincontroller.Setotp(true);

      FirstTimeUserProfile();

    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              behavior: SnackBarBehavior.floating,
              backgroundColor: Color(0xffffeeee),
              duration:
              Duration(milliseconds: 2000),
              elevation: 5,
              width: 150,
              shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(25)),
              content: Center(
                  child: Text(
                    "Invalid Otp",
                    style: TextStyle(
                        color: Color(0xffEF505F),
                        fontSize: 16),
                  ))));
    }
  }

  void sendOtp() async {
    emailOtp.setConfig(
        appEmail: "login@gmail.com",
        appName: "login",
        otpLength: 6,
        otpType: OTPType.digitsOnly,
        userEmail: widget.email);
    if (await emailOtp.sendOTP() == true) {
      EasyLoading.show();
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              behavior: SnackBarBehavior.floating,
              backgroundColor: Color(0xffffeeee),
              duration:
              Duration(milliseconds: 2000),
              elevation: 5,
              width: 150,
              shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(25)),
              content: Center(
                  child: Text(
                    "Send Otp",
                    style: TextStyle(
                        color: Color(0xffEF505F),
                        fontSize: 16),
                  ))));
      EasyLoading.dismiss();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              behavior: SnackBarBehavior.floating,
              backgroundColor: Color(0xffffeeee),
              duration:
              Duration(milliseconds: 2000),
              elevation: 5,
              width: 150,
              shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(25)),
              content: Center(
                  child: Text(
                    "Failed Otp",
                    style: TextStyle(
                        color: Color(0xffEF505F),
                        fontSize: 16),
                  ))));
    }
  }

  Future FirstTimeUserProfile() async {
    logincontroller.sharedPreferences = await SharedPreferences.getInstance();
    bool check = (logincontroller.sharedPreferences!.getBool("okk") ?? false);
    if (check) {
      Get.off(HomeScreen());
    } else {
      await logincontroller.sharedPreferences!.setBool('okk', true);
      Get.off(AddProfile());
    }
  }

}
