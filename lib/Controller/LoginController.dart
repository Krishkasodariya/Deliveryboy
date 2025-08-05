import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_order/ModelClass/DeliveryBoyModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  SharedPreferences? sharedPreferences;
  var deliverBoyid = "";
  var LoginGoogleEmail = "";
  String imageurl = "";
  bool changeColor = false;

  var password;
  var confirmPassword;
  var checkOtp = false;

  TextEditingController addname = TextEditingController();
  TextEditingController addemail = TextEditingController();
  TextEditingController addphonenumber = TextEditingController();

  var LoginCountryCode = "";
  var LoginIsoCode = "";
  PhoneNumber number =
      PhoneNumber(isoCode: 'IN', dialCode: "+91", phoneNumber: "");

  XFile? file;
  final ImagePicker picker = ImagePicker();
  String filename = DateTime.now().millisecondsSinceEpoch.toString();

  Function? reference;
  Function? updateData;

  void AllUpdate(Function ref) {
    reference = ref;
  }

  void profileUpdate(Function ref) {
    updateData = ref;
  }

  Future Setuid(String uid) async {
    sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences!.setString("uid", uid);
  }

  Future Getuid() async {
    try {
      sharedPreferences = await SharedPreferences.getInstance();
      deliverBoyid = sharedPreferences!.getString("uid")!;
      print("1111$deliverBoyid}");
    } catch (e) {
      print(e);
    }
  }

  Future<void> Setotp(bool otp) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool("checkOtp", otp);
  }

  Future<void> Getotp() async {
    try {
      SharedPreferences? sharedPreferences = await SharedPreferences.getInstance();
      if (sharedPreferences != null) {
        checkOtp = sharedPreferences.getBool("checkOtp") ?? false;
        if (checkOtp != null) {
          print("111111111111111111111 $checkOtp");
        } else {
          print("11111111111111111111111 Value not found in SharedPreferences");
        }
      } else {
        print("SharedPreferences instance is null");
      }
    } catch (e) {
      print("Error retrieving value from SharedPreferences: $e");
    }
  }

  void add_DeliveryBoy_Data(
      DeliveryBoyModel deliveryBoyModel, String deliverBoyidData) async {
    await FirebaseFirestore.instance
        .collection("deliveryBoy")
        .doc(deliverBoyidData)
        .set(deliveryBoyModel.toJson());
  }

  Future takephoto(ImageSource source) async {
    file = await picker.pickImage(source: source);
    print("-----file!.path------${file!.path}");
    addphoto();
    reference!();
  }

  Future addphoto() async {
    if (file == null) {
      return;
    }

    Reference storage = FirebaseStorage.instance.ref();
    Reference imagedir = storage.child("Deliveryimages");
    Reference upload = imagedir.child(filename);
    try {
      await upload.putFile(File(file!.path));
      print("111111111111${file!.path}");
      imageurl = await upload.getDownloadURL();
      print("-----------logincontroller.imageurl----------------)${imageurl}");
      print("22222222222${file!.path}");
      reference!();
    } catch (e) {
      print('========)${e}');
    }
  }

  Future profileData() async {
    deliverBoyid = sharedPreferences!.getString("uid")!;

    await FirebaseFirestore.instance
        .collection('deliveryBoy')
        .where("Uid", isEqualTo: "${deliverBoyid}")
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        addname.text = doc["Name"];
        addemail.text = doc["Email"];
        addphonenumber.text = doc["PhoneNumber"];
        imageurl = doc["Image"];
        password = doc["Password"];
        confirmPassword = doc["ConfirmPassword"];

        print("22222222222222222");
        updateData!();
      });
    });
  }

  Future<void> logout() async {
    FirebaseAuth.instance.signOut();
    addname.text = "";
    addphonenumber.text = "";
    addemail.text = "";
    imageurl = "";
    deliverBoyid = "";
    LoginIsoCode = "";
    LoginCountryCode = "";
    print("-----11------)${sharedPreferences!.get("savedata")}");
    print("----11-------)${sharedPreferences!.get("uid")}");
    sharedPreferences!.remove("checkOtp");
    sharedPreferences!.remove("uid");
  }

  Color getColor(bool pending, bool processing, bool deliver) {
    if (pending) {
      return Color(0xffF1802D);
      //0xffFC6701
    } else if (processing) {
      return Color(0xff59A8B1);
    } else if (deliver) {
      return Color(0xff16A850);
    } else {
      return Color(0xffEF4F5F);
    }
  }

  String getTextData(bool pending, bool processing, bool deliver) {
    if (pending) {
      return "Pending Order";
    } else if (processing) {
      return "Proceesing Order";
    } else if (deliver) {
      return "Delivered";
    } else {
      return "Conform Order";
    }
  }

 Color setAppBarColor( TabController? tabController) {

    if (tabController!.index == 0) {
      return Color(0xffEF4F5F);
    } else if (tabController.index == 1) {
      return Color(0xffF1802D);
    } else if (tabController.index == 2) {
      return Color(0xff59A8B1);
    } else if (tabController.index == 3) {
      return Color(0xff16A850);
    }
    else{
      return Color(0xffEF4F5F);
    }
  }

}
