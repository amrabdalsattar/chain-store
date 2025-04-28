class ApiConstants {
  static const String baseUrl = 'http://connectchain.runasp.net/api/';

  // Auth endpoints
  static const String loginEP = 'Account/SignIn';
  static const String signUpEP = 'Account/Register';
  static const String forgetPasswordEP = 'Account/ForgetPassword';
  static const String otpVerificationEP = 'Account/VerifyOtp';
  static const String resetPasswordEP = 'Account/ResetPassword';

  // Product endpoints
  static const String addProductEP = 'Product/AddProduct';
  static const String getSupplierProductsEP = 'Product/GetSupplierProducts';
  static const String deleteProductEP = 'Product/DeleteProduct';
  static const String updateProductEP = 'Product/UpdateProduct';
  static const String getProductDetailsEP = 'Product/GetProductDetails';
  static const String getProductForUpdateEp = 'Product/GetProductForUpdate';
  static const String deleteProductImageEP = 'Product/DeleteProductImage';

  // Dashboard endpoints
  static const String monthlyStatsEP = 'Dashboard/GetMonthlyStats';
  static const String revenueChartEP = 'Dashboard/GetRevenueChart';
  static const String topSoldProductsEP = 'Dashboard/GetTopSoldProducts';
  static const String ordersSummaryEP = 'Dashboard/GetOrdersSummary';
  static const String productsSummaryEP = 'Dashboard/GetProductsSummary';

  // Orders endpoints

  static const String getSupplierOrders = 'Order/GetSupplierOrders';
  static const String getOrderDetails = 'Order/GetOrderDetails';

  // Profile endpoints
  static const String supplierProfile = 'Supplier/getProfile';
  static const String updateSupplierProfile = 'Order/Supplier/getProfile';

  // Notifications Endpoints
  static const String getNotificationsEP =
      'Notification/GetSupplierNotifications';
  static const String updateFCMTokenEP = 'Supplier/UpdateFcmToken';
  // Api query params
  static const String productId = 'productId';
  static const String imgUrl = 'imageUrl';
  static const String supplierId = 'SupplierId';
  static const String orderStatus = 'OrderStatus';
  static const String orderId = 'orderId';

  static const Duration timeOut = Duration(seconds: 20);
}
