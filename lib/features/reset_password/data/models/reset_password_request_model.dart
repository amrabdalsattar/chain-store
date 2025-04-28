class ResetPasswordRequestModel {
  final String email;
  final String password;
  final String confirmPassword;

  const ResetPasswordRequestModel({
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "confirmPassword": confirmPassword,
      };
}
