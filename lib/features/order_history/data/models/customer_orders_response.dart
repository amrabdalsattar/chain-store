class CustomerOrdersResponse {
  final List<OrderDataModel> orders;

  CustomerOrdersResponse({required this.orders});

  factory CustomerOrdersResponse.fromJson(Map<String, dynamic> json) {
    return CustomerOrdersResponse(
      orders:
          (json['data'] as List)
              .map((e) => OrderDataModel.fromJson(e))
              .toList(),
    );
  }
}

class OrderDataModel {
  final String orderNumber;
  final DateTime orderDate;
  final double totalAmount;
  final String status;
  final String paymentMethod;
  final double subTotal;
  final double deliveryFees;
  final double discount;
  final int totalItems;
  final List<Product> products;

  OrderDataModel({
    required this.orderNumber,
    required this.orderDate,
    required this.totalAmount,
    required this.status,
    required this.paymentMethod,
    required this.subTotal,
    required this.deliveryFees,
    required this.discount,
    required this.totalItems,
    required this.products,
  });

  factory OrderDataModel.fromJson(Map<String, dynamic> json) {
    return OrderDataModel(
      orderNumber: json['orderNumber'],
      orderDate: DateTime.parse(json['orderDate']),
      totalAmount: (json['totalAmount'] as num).toDouble(),
      status: json['status'],
      paymentMethod: json['paymentMethod'],
      subTotal: (json['subTotal'] as num).toDouble(),
      deliveryFees: (json['deliveryFees'] as num).toDouble(),
      discount: (json['discount'] as num).toDouble(),
      totalItems: json['totalItems'],
      products:
          (json['products'] as List).map((e) => Product.fromJson(e)).toList(),
    );
  }
}

class Product {
  final int productId;
  final String productName;
  final int quantity;
  final double unitPrice;
  final double totalPrice;
  final String productImage;
  final String supplierName;

  Product({
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.unitPrice,
    required this.totalPrice,
    required this.productImage,
    required this.supplierName,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productId: json['productId'],
      productName: json['productName'],
      quantity: json['quantity'],
      unitPrice: (json['unitPrice'] as num).toDouble(),
      totalPrice: (json['totalPrice'] as num).toDouble(),
      productImage: json['productImage'],
      supplierName: json['supplierName'],
    );
  }
}
