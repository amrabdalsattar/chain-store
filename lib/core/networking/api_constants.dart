class ApiConstants {
  static const String baseUrl = 'http://connectchain.runasp.net/api/';

  // Auth endpoints
  static const String loginEP = 'Account/SignIn';
  static const String signUpEP = 'Account/Register';
  static const String forgetPasswordEP = 'Account/ForgetPassword';
  static const String otpVerificationEP = 'Account/VerifyOtp';
  static const String resetPasswordEP = 'Account/ResetPassword';

  // Notifications Endpoints
  static const String getNotificationsEP =
      'Notification/GetSupplierNotifications';
  static const String updateFCMTokenEP = 'Supplier/UpdateFcmToken';

  // Cart Endpoints
  static const String getCartItemsEP = 'Cart/GetCartItems';
  static const String addToCartEP = 'Cart/AddItemToCart';
  static const String removeFromCartEP = 'Cart/RemoveFromCart';
    static const String incrementCartItem = 'Cart/IncrementCartItem';
  static const String decrementCartItem = 'Cart/DecrementCartItem';


  // Orders Endpoints
  static const String placeOrderEP = 'Order/PlaceOrder';
  static const String getCustomerOrdersEP = 'Order/GetCustomerOrders';

  // RFQ Endpoints
  static const String createRFQEP = 'RFQ/Create';
  static const String getCustomerRFQsEP = 'RFQ/Customer';
  static const String getCustomerQuotationByIdEP = 'RFQ/Customer';
  static const String assignSupplierToRFQEP = 'RFQ/AssignSuppliers';
  static const String getRFQQuotationsEp = 'Quotation/ByRFQ';
  static const String getQuotationDetailsEP = 'Quotation/';
  static const String acceptQuotationEP = 'Quotation/Approve';
  static const String rejectQuoationEP = 'Quotation/Reject';

  // Stripe Endpoints
  static const stripeBaseUrl = 'https://api.stripe.com/v1/';
  static const createPaymentIntentEndPoint = 'payment_intents';
  static const createEphemeralKeyEndPoint = 'ephemeral_keys';

  // Categories Endpoints
  static const getAllCategoriesEP = 'Category/GetAll';

  // Home Endpoints
  static const getTopSuppliersEP = 'Supplier/GetSuppliers';

  // Suppliers Endpoints
  static const exploreSuppliersEP = 'Supplier/SearchByName';

  // Products Endpoints
  static const getMatchedProductsEP = 'Product/GetMatchedProducts';
  static const getRecommendedProductsEP = 'Product/GetRecommendedForCustomer';
  static const getSupplierProductsEP = 'Product/GetSupplierProducts';
  static const getProductDetailsEP = 'Product/CustomerGetProductDetails';
  // Reviews Endpoints

  static const addReview = 'Review/AddReview';
  static const updateReivew = 'Review/UpdateReview';

  // Wishlist Endpoints
  static const getWishlistItemsEP = 'Wishlist/GetWishlistProducts';
  static const addToWishlistEP = 'Wishlist/AddToWishlist';
  static const removeFromWishlistEP = 'Wishlist/RemoveFromWishlist';

  // Profile Endpoints
  static const getCustomerProfileEP = 'Customer/GetProfile';
  static const updateCustomerProfileEP = 'Customer/UpdateProfile';

  // Categories Endpoints
  static const getProductsByCategoryEP = 'Product/GetProductsByCategory';
  static const getCategoriesEP = 'Category/GetAll';

  static const Duration timeOut = Duration(seconds: 20);
}
