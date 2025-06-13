class CartResponseModel {
  CartInfo? cartInfo;
  String? message;

  CartResponseModel({this.cartInfo, this.message});

  CartResponseModel.fromJson(Map<String, dynamic> json) {
    cartInfo = json['data'] != null ? CartInfo.fromJson(json['data']) : null;

    message = json['message'];
  }
}

class CartInfo {
  int? total;
  List<CartItemModel>? items;

  CartInfo({this.total, this.items});

  CartInfo.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['items'] != null) {
      items = <CartItemModel>[];
      json['items'].forEach((v) {
        items!.add(CartItemModel.fromJson(v));
      });
    }
  }
}

class CartItemModel {
  int? productId;
  String? productName;
  String? productImage;
  int? price;
  int? quantity;
  int? minimumOrder;

  CartItemModel({
    this.productId,
    this.productName,
    this.productImage,
    this.price,
    this.quantity,
    this.minimumOrder,
  });

  CartItemModel.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    productName = json['productName'];
    productImage = json['productImage'];
    price = json['price'];
    quantity = json['quantity'];
    minimumOrder = json['minimumOrder'];
  }
}
