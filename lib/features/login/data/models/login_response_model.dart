class LoginResponseModel {
  UserData? userData;
  String? message;

  LoginResponseModel({
    this.userData,
    this.message,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        userData: UserData.fromJson(json["data"]),
        message: json["message"],
      );
}

class UserData {
  final String id;
  final String name;
  final String email;
  final String address;
  final String token;
  final String phone;
  dynamic businessType;

  UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.token,
    required this.phone,
    required this.businessType,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        address: json["address"],
        token: json["token"],
        phone: json["phone"],
        businessType: json["businessType"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "address": address,
        "token": token,
        "phone": phone,
        "businessType": businessType,
      };
}
