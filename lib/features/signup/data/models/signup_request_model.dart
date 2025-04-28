class SignupRequestModel {
  String name;
  String phoneNumber;
  String email;
  String password;
  String businessType;
  String address;
  String confirmPassword;
  int role;

  SignupRequestModel({
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.password,
    required this.businessType,
    required this.address,
    required this.confirmPassword,
    required this.role,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "phoneNumber": phoneNumber,
        "email": email,
        "password": password,
        "businessType": businessType,
        "address": address,
        "confirmPassword": confirmPassword,
        "role": role,
      };
}
