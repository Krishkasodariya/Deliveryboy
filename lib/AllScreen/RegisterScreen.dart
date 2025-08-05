import 'package:delivery_order/ModelClass/DeliveryBoyModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Controller/LoginController.dart';
import 'AddProfile.dart';
import 'HomeScreen.dart';
import 'LoginScreen.dart';

class RegisterScreen extends StatefulWidget {
  static String varifyphoneotp = "";

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  LoginController logincontroller = Get.find();
  bool obsecureConfirmPassword = false;
  bool obsecurePassword = false;

  var data ;

  TextEditingController rname = TextEditingController();
  TextEditingController remail = TextEditingController();
  TextEditingController rpassword = TextEditingController();
  TextEditingController rconfirmPassword = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
                            "Register Here",
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
                                  Icons.person,
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
                                    controller: rname,
                                    autofocus: false,
                                    cursorColor: Color(0xff7E8286),
                                    decoration: InputDecoration(
                                      hintText: "Enter User Name",
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
                                    controller: remail,
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
                                    controller: rpassword,
                                    obscureText: obsecurePassword,
                                    autofocus: false,
                                    cursorColor: Color(0xff7E8286),
                                    decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            setState(() {});
                                            obsecurePassword = !obsecurePassword;
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
                                    controller: rconfirmPassword,
                                    obscureText: obsecureConfirmPassword,
                                    autofocus: false,
                                    cursorColor: Color(0xff7E8286),
                                    decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            setState(() {});
                                            obsecureConfirmPassword =
                                                !obsecureConfirmPassword;
                                          },
                                          icon: obsecureConfirmPassword
                                              ? Icon(Icons.visibility,
                                                  color: Colors.black45)
                                              : Icon(Icons.visibility_off,
                                                  color: Colors.black45)),
                                      hintText: "Enter Confirm Password",
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
                                if (rname.text.isEmpty) {
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
                                            "Enter Name",
                                            style: TextStyle(
                                                color: Color(0xffEF505F),
                                                fontSize: 16),
                                          ))));
                                } else if (remail.text.isEmpty) {
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
                                } else if (data!=null && !RegExp(r'\S+@\S+\.\S+').hasMatch(data)) {
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
                                } else if (rpassword.text.isEmpty) {
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
                                } else if (rpassword.text.length <
                                    6) {
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
                                } else if (rconfirmPassword.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          behavior: SnackBarBehavior.floating,
                                          backgroundColor: Color(0xffffeeee),
                                          duration:
                                              Duration(milliseconds: 2000),
                                          elevation: 5,
                                          width: 220,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                          content: Center(
                                              child: Text(
                                            "Enter confirmPassword",
                                            style: TextStyle(
                                                color: Color(0xffEF505F),
                                                fontSize: 16),
                                          ))));
                                } else if (rconfirmPassword.text.length <
                                    6) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          behavior: SnackBarBehavior.floating,
                                          backgroundColor: Color(0xffffeeee),
                                          duration:
                                              Duration(milliseconds: 2000),
                                          elevation: 5,
                                          width: 240,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                          content: Center(
                                              child: Text(
                                            "confirmPassword should be at least 6 characters long",
                                            style: TextStyle(
                                                color: Color(0xffEF505F),
                                                fontSize: 16),
                                          ))));
                                } else if (rconfirmPassword.text != rpassword.text) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          behavior: SnackBarBehavior.floating,
                                          backgroundColor: Color(0xffffeeee),
                                          duration:
                                              Duration(milliseconds: 2000),
                                          elevation: 5,
                                          width: 220,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                          content: Center(
                                              child: Text(
                                            "Password Doesn't Match",
                                            style: TextStyle(
                                                color: Color(0xffEF505F),
                                                fontSize: 16),
                                          ))));
                                } else {
                                  emailAuthentication(
                                      remail.text,
                                      rpassword.text);

                                }
                              },
                              child: Text(
                                "Sign up",
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
                            "Already have account?",
                            style: GoogleFonts.nunito(
                                fontSize: 17,
                                color: Colors.black87,
                                fontWeight: FontWeight.w400),
                          ),

                          TextButton(
                            onPressed: () {
                          Get.off(LoginScreen());
                            },
                            child: Text(
                              "Sign in",
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

  void emailAuthentication(String email, String password) async {
    try {
      EasyLoading.show();
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      logincontroller.Setuid(userCredential.user!.uid);
      print("rrrrrrrrrrrrrr${userCredential.user!.uid}");

      logincontroller.add_DeliveryBoy_Data(
          DeliveryBoyModel(
              isocode: "",
              dialcode: "",
              phonenumber: "",
              name: rname.text,
              email: remail.text,
              confirmPassword: rconfirmPassword.text,
              password: rpassword.text,
              uid: userCredential.user!.uid,
              image: ""),
          userCredential.user!.uid

      );

      FirstTimeUserProfile();
      EasyLoading.dismiss();
    } catch (e) {
      EasyLoading.dismiss();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Color(0xffffeeee),
          duration: Duration(milliseconds: 3000),
          elevation: 5,
          width: 280,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          content: Center(
              child: Text(
            "This Email already use in Foodie",
            style: TextStyle(color: Color(0xffEF505F), fontSize: 16),
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
