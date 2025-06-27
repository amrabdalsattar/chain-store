class CustomerProfileResponse {
  final CustomerData customer;

  CustomerProfileResponse({required this.customer});

  factory CustomerProfileResponse.fromJson(Map<String, dynamic> json) {
    return CustomerProfileResponse(
      customer: CustomerData.fromJson(json['data']),
    );
  }
}

class CustomerData {
  final String? id;
  final String? name;
  final String? email;
  final String? phoneNumber;
  final String? address;
  final String? businessType;
  final String? imageUrl;

  CustomerData({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.businessType,
    required this.imageUrl,
  });

  factory CustomerData.fromJson(Map<String, dynamic> json) {
    return CustomerData(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phoneNumber'] ?? '',
      address: json['address'],
      businessType: json['businessType'],
      imageUrl: json['imageUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'address': address,
      'businessType': businessType,
      'imageUrl': imageUrl,
    };
  }
}
