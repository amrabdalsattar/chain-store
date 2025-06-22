import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/cart/data/datasources/cart_remote_datasource.dart';
import '../../features/cart/data/repos/cart_repo.dart';
import '../../features/checkout_order/data/datasources/place_order_datasource.dart';
import '../../features/checkout_order/data/repos/checkout_repo.dart';
import '../../features/explore_suppliers/data/datasources/suppliers_datasource.dart';
import '../../features/explore_suppliers/data/repos/suppliers_repo.dart';
import '../../features/home/data/datasources/home_remote_datasource.dart';
import '../../features/home/data/repos/home_repo.dart';
import '../../features/login/data/datasources/login_datasource.dart';
import '../../features/login/data/repos/login_repo.dart';
import '../../features/checkout_order/data/datasources/stripe_service.dart';
import '../../features/pre_login/data/datasources/pre_login_datasource.dart';
import '../../features/pre_login/data/repos/pre_login_repo.dart';
import '../../features/reset_password/data/datasources/reset_password_data_source.dart';
import '../../features/reset_password/data/repos/reset_password_repo.dart';
import '../../features/signup/data/datasources/signup_data_source.dart';
import '../../features/signup/data/repos/signup_repo.dart';
import '../../features/wishlist/data/datasources/wishlist_datasource.dart';
import '../../features/wishlist/data/repos/wishlist_repo.dart';
import '../networking/api_helper.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setUpGetIt() async {
  // Networking DI
  getIt.registerLazySingleton<Dio>(() => DioFactory.instance);
  getIt.registerLazySingleton<ApiHelper>(() => DioHelper(getIt()));

  // Authentication DI
  getIt.registerLazySingleton<LoginDatasource>(() => LoginDatasource(getIt()));
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));

  getIt.registerLazySingleton<SignupDataSource>(
    () => SignupDataSource(getIt()),
  );
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));

  getIt.registerLazySingleton<ResetPasswordDataSource>(
    () => ResetPasswordDataSource(getIt()),
  );
  getIt.registerLazySingleton<ResetPasswordRepo>(
    () => ResetPasswordRepo(getIt()),
  );
  getIt.registerLazySingleton<PreLoginDatasource>(
    () => PreLoginDatasource(getIt()),
  );
  getIt.registerLazySingleton<PreLoginRepo>(() => PreLoginRepo(getIt()));

  // Cart DI
  getIt.registerLazySingleton<CartRemoteDatasource>(
    () => CartRemoteDatasource(getIt()),
  );
  getIt.registerLazySingleton<CartRepo>(() => CartRepo(getIt()));

  // Checkout order
  getIt.registerLazySingleton<StripeService>(() => StripeService(getIt()));
  getIt.registerLazySingleton<PlaceOrderDatasource>(
    () => PlaceOrderDatasource(getIt()),
  );
  getIt.registerLazySingleton<CheckoutRepo>(
    () => CheckoutRepo(getIt<StripeService>(), getIt<PlaceOrderDatasource>()),
  );

  // Home
  getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSource(getIt()),
  );
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));

  // Suppliers
  getIt.registerLazySingleton<SuppliersDatasource>(
    () => SuppliersDatasource(getIt()),
  );
  getIt.registerLazySingleton<SuppliersRepo>(() => SuppliersRepo(getIt()));

  // Wishlist
  getIt.registerLazySingleton<WishlistDatasource>(
    () => WishlistDatasource(getIt<ApiHelper>()),
  );
  getIt.registerLazySingleton<WishlistRepo>(() => WishlistRepo(getIt()));
}
