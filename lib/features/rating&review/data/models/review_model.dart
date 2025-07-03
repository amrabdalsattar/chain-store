class ReviewModel {
  final double rate;
  final int? productId;
  final String review;
  final String customerImage;
  final String customerName;

  ReviewModel({
    required this.customerImage,
    required this.customerName,
    required this.rate,
    required this.review,
    this.productId,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
    rate: json['rate'],
    review: json['review'],
    customerName: json['customerName'],
    customerImage: json['customerImage'],
  );

  Map<String, dynamic> toJson() {
    return {'body': review, 'rate': rate.toInt(), 'productId': productId};
  }
}
