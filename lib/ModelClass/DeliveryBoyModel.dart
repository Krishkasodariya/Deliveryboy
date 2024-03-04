class DeliveryBoyModel {
  String? name;
  String? email;
  String? password;
  String? confirmPassword;
  String uid;
  String? image;

  String isocode;
  String? dialcode;
  String? phonenumber;

  DeliveryBoyModel({required this.name,
    required this.email,
    required this.uid,
    required this.image,
    required this.isocode,
    required this.dialcode,
    required this.phonenumber,
    this.confirmPassword,
    this.password,});

  Map<String, dynamic> toJson() {
    return {
      "Name": name,
      "Email": email,
      "Password": password,
      "ConfirmPassword": confirmPassword,
      "Image": image,
      "Uid": uid,
      "IsoCode": isocode,
      "DialCode": dialcode,
      "PhoneNumber": phonenumber,
    };
  }

  factory DeliveryBoyModel.fromJson(Map<String, dynamic> data) {
    return DeliveryBoyModel(
        dialcode: data["IsoCode"],
        isocode: data["DialCode"],
        phonenumber: data["PhoneNumber"],
        name: data["Name"],
        email: data["Email"],
        password: data["Password"],
        image: data["Image"],
        confirmPassword: data["ConfirmPassword"],
        uid: data["Uid"]);
  }
}
