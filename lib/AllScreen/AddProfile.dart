import 'package:delivery_order/AllScreen/HomeScreen.dart';
import 'package:delivery_order/AllScreen/takeProfilePhotoDialog.dart';
import 'package:delivery_order/ModelClass/DeliveryBoyModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import '../Controller/LoginController.dart';

class AddProfile extends StatefulWidget {
  const AddProfile({super.key});

  @override
  State<AddProfile> createState() => _AddProfileState();
}

class _AddProfileState extends State<AddProfile> {
  final ImagePicker picker = ImagePicker();
  var changeEmail;
  XFile? file;

  String filename = DateTime.now().millisecondsSinceEpoch.toString();
  LoginController logincontroller = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    logincontroller.Getuid();
    logincontroller.AllUpdate(ref);
    logincontroller.profileUpdate(ref);

    logincontroller.profileData();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: () {
                Get.off(HomeScreen());
            },
            child: Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
              size: 23,
            )),
        title: Text("Complete your profile",
            style: GoogleFonts.lexend(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w400)),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: WillPopScope(
          onWillPop: () {
            return Future.value(false);
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,

            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Center(
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
                          borderRadius: BorderRadius.all(Radius.circular(60)),
                          child: Container(
                              width: 110,
                              height: 110,
                              decoration: BoxDecoration(
                                color: Color(0xffE9E9F7),
                                shape: BoxShape.circle,
                              ),
                              child: Image(
                                image: NetworkImage(logincontroller.imageurl),
                                fit: BoxFit.cover,
                              )),
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        backgroundColor: Color(0xffF4F6FA),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20))),
                        context: context,
                        builder: (context) {
                          return takeProfilePhotoDialog();
                        },
                      );
                    },
                    child: Text("Change photo",
                        style: GoogleFonts.nunito(
                            color: Color(0xffEF4F5F),
                            fontSize: 16,
                            fontWeight: FontWeight.w500)),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    children: [
                      TextField(
                        controller: logincontroller.addname,
                        decoration: InputDecoration(
                            label: Text("addname",
                                style: TextStyle(
                                  color: Color(0xffA2A7B4),
                                )),
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Color(0xffa2a7b4), width: 1),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Color(0xffEF4F5F), width: 1),
                            )),
                        style: GoogleFonts.nunito(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                // -------------------------------)
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: InternationalPhoneNumberInput(
                        onInputChanged: (value) {
                          setState(() {
                            logincontroller.LoginCountryCode = "${value.dialCode}";
                            logincontroller.LoginIsoCode = "${value.isoCode}";
                            logincontroller.number = PhoneNumber(
                                isoCode: value.isoCode,
                                dialCode: value.dialCode,
                                phoneNumber: "");
                          });
                        },
                        initialValue: logincontroller.number,
                        textFieldController: logincontroller.addphonenumber,
                        selectorConfig: SelectorConfig(
                            selectorType: PhoneInputSelectorType.BOTTOM_SHEET),
                        inputDecoration: InputDecoration(
                          hintText: "Enter Mobile Number",
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                          border: InputBorder.none,
                        ),
                        textStyle: GoogleFonts.nunito(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                        selectorTextStyle: GoogleFonts.nunito(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                        searchBoxDecoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Color(0xffa2a7b4), width: 1),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Color(0xffEF4F5F), width: 1),
                            )),
                        textAlignVertical: TextAlignVertical.top,
                        ignoreBlank: false,
                        autoValidateMode: AutovalidateMode.disabled,
                        cursorColor: Colors.black,
                      ),
                    ),

                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.symmetric(
                            horizontal:
                                BorderSide(color: Color(0xffa2a7b4), width: 0.5))),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {

                        changeEmail = value;
                        logincontroller.changeColor = true;
                      });
                    },
                    controller: logincontroller.addemail,
                    decoration: InputDecoration(
                        label: Text("addemail",
                            style: TextStyle(
                              color: Color(0xffA2A7B4),
                            )),
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xffa2a7b4), width: 1),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xffEF4F5F), width: 1),
                        )),
                    style: GoogleFonts.nunito(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          minimumSize:
                              MaterialStateProperty.all(Size(double.infinity, 50)),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15)))),
                          backgroundColor: logincontroller.changeColor
                              ? MaterialStateProperty.all(Color(0xffEF505F))
                              : MaterialStateProperty.all(Color(0xff9196A5))),
                      onPressed: () {
                        if (logincontroller.addname.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Color(0xffffeeee),
                              duration: Duration(milliseconds: 2000),
                              elevation: 5,
                              width: 200,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              content: Center(
                                  child: Text(
                                "Enter Name",
                                style: TextStyle(
                                    color: Color(0xffEF505F), fontSize: 16),
                              ))));
                        } else if (logincontroller.addphonenumber.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Color(0xffffeeee),
                              duration: Duration(milliseconds: 2000),
                              elevation: 5,
                              width: 200,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              content: Center(
                                  child: Text(
                                "Enter Phone Number",
                                style: TextStyle(
                                    color: Color(0xffEF505F), fontSize: 16),
                              ))));
                        } else if (logincontroller.addemail.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Color(0xffffeeee),
                              duration: Duration(milliseconds: 2000),
                              elevation: 5,
                              width: 200,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              content: Center(
                                  child: Text(
                                "Enter Email",
                                style: TextStyle(
                                    color: Color(0xffEF505F), fontSize: 16),
                              ))));
                        } else if (changeEmail != null && !RegExp(r'\S+@\S+\.\S+').hasMatch(changeEmail)) {

                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Color(0xffffeeee),
                              duration: Duration(milliseconds: 2000),
                              elevation: 5,
                              width: 200,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              content: Center(
                                  child: Text(
                                "Invalid Email Address",
                                style: TextStyle(
                                    color: Color(0xffEF505F), fontSize: 16),
                              ))));
                        } else if (logincontroller.imageurl.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Color(0xffffeeee),
                              duration: Duration(milliseconds: 2000),
                              elevation: 5,
                              width: 200,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              content: Center(
                                  child: Text(
                                "Enter Photo",
                                style: TextStyle(
                                    color: Color(0xffEF505F), fontSize: 16),
                              ))));
                        } else {
                          logincontroller.addphoto();

                          logincontroller.add_DeliveryBoy_Data(DeliveryBoyModel(
                              name: logincontroller.addname.text,
                              dialcode: logincontroller.LoginCountryCode,
                              phonenumber: "${logincontroller.addphonenumber.text}",
                              email: logincontroller.addemail.text,
                              image: logincontroller.imageurl,
                              uid: logincontroller.deliverBoyid,
                              isocode: logincontroller.LoginIsoCode,
                              confirmPassword: logincontroller.confirmPassword,
                              password: logincontroller.password),
                              logincontroller.deliverBoyid
                          );
                          Get.to(HomeScreen());
                        }
                      },
                      child: Text(
                        "Add Profile",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      )),
                ),
                Spacer(),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


  void ref() {
    setState(() {});
  }
}
