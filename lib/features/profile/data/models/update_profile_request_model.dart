class UpdateProfileRequest {
  final String name;
  final String phoneNumber;
  final String address;
  final String businessType;
  final String imageUrl;

  UpdateProfileRequest({
    required this.name,
    required this.phoneNumber,
    required this.address,
    required this.businessType,
    required this.imageUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
      'address': address,
      'businessType': businessType,
      'imageUrl': imageUrl,
    };
  }
}
