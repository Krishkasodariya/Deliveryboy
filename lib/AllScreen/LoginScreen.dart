import 'package:delivery_order/AllScreen/EmailOtp.dart';
import 'package:delivery_order/AllScreen/RegisterScreen.dart';
import 'package:delivery_order/Controller/LoginController.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ForgotPasswordScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController loginEmail = TextEditingController();
  TextEditingController loginPassword = TextEditingController();

  LoginController loginController=Get.find();
  bool obsecureConfirmPassword = false;
  bool obsecurePassword = false;

  var data ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: WillPopScope(
        onWillPop: ()  {
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
                            "Login Here",
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
                                    controller: loginEmail,
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
                        height: 10,
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
                                  Icons.lock,
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
                                    controller: loginPassword,
                                    obscureText: obsecurePassword,
                                    autofocus: false,
                                    cursorColor: Color(0xff7E8286),
                                    decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            setState(() {});
                                            obsecurePassword =
                                            !obsecurePassword;
                                          },
                                          icon: obsecurePassword
                                              ? Icon(Icons.visibility,
                                              color: Colors.black45)
                                              : Icon(Icons.visibility_off,
                                              color: Colors.black45)),
                                      hintText: "Enter Password",
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
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                            onPressed: () {
                              Get.to(ForgotPasswordScreen());
                            },
                            child: Text("Forgot Password?",
                              style: GoogleFonts.nunito(
                                  fontSize: 17,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w400),
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

                                 if (loginEmail.text.isEmpty) {
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
                                else if (data!=null &&!RegExp(r'\S+@\S+\.\S+').hasMatch(data)) {
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
                                else if (loginPassword.text.isEmpty) {
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
                                                "Enter Password",
                                                style: TextStyle(
                                                    color: Color(0xffEF505F),
                                                    fontSize: 16),
                                              ))));
                                }
                                else if (loginPassword.text.length < 6) {
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
                                                "Password should be at least 6 characters long",
                                                style: TextStyle(
                                                    color: Color(0xffEF505F),
                                                    fontSize: 16),
                                              ))));
                                }
                               else {
                                   login_with_email(loginEmail.text,loginPassword.text);
                                }
                              },
                              child: Text(
                                "Sign in",
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have account?",
                            style: GoogleFonts.nunito(
                                fontSize: 17,
                                color: Colors.black87,
                                fontWeight: FontWeight.w400),
                          ),

                          TextButton(
                            onPressed: () {
                              Get.off(RegisterScreen());
                            },
                            child: Text(
                              "Sign up",
                              style: GoogleFonts.nunito(
                                  fontSize: 17,
                                  color: Color(0xffEF505F),
                                  fontWeight: FontWeight.w400),
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
  void login_with_email(String email, String password) async {
    try {
      EasyLoading.show();

      UserCredential userCredential =await FirebaseAuth.instance.signInWithEmailAndPassword(email: loginEmail.text, password: loginPassword.text);
      loginController.Setuid(userCredential.user!.uid);

      print("lllllllllllllllll${userCredential.user!.uid}");


      Get.to(EmailOtp(email:loginEmail.text,));
      EasyLoading.dismiss();

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
                width: 230,
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
      else if (e.code == 'wrong-password'){
        print('---------------------------------)wrong-password');
        EasyLoading.dismiss();
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
                      "Wrong password",
                      style: TextStyle(
                          color: Color(0xffEF505F),
                          fontSize: 16),
                    ))));

      }

    }
  }


}
