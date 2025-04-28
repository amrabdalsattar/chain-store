import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/login/data/datasources/login_datasource.dart';
import '../../features/login/data/repos/login_repo.dart';
import '../../features/pre_login/data/datasources/pre_login_datasource.dart';
import '../../features/pre_login/data/repos/pre_login_repo.dart';
import '../../features/reset_password/data/datasources/reset_password_data_source.dart';
import '../../features/reset_password/data/repos/reset_password_repo.dart';
import '../../features/signup/data/datasources/signup_data_source.dart';
import '../../features/signup/data/repos/signup_repo.dart';
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
}
