import '../../../features/login/data/models/login_response_model.dart';
import '../../routing/routes.dart';
import '../token_helper.dart';
import 'secured_storage_helper.dart';
import 'shared_preferences_helper.dart';
import 'shared_preferences_keys.dart';

class UserDataOperator {
  static Map<String, dynamic> getUserData() {
    return {
      SharedPreferencesKeys.userName: SharedPreferencesHelper.getString(
        SharedPreferencesKeys.userName,
      ),
      SharedPreferencesKeys.userId: SharedPreferencesHelper.getString(
        SharedPreferencesKeys.userId,
      ),
      SharedPreferencesKeys.userAddress: SharedPreferencesHelper.getString(
        SharedPreferencesKeys.userAddress,
      ),
      SharedPreferencesKeys.userEmail: SharedPreferencesHelper.getString(
        SharedPreferencesKeys.userEmail,
      ),
      SharedPreferencesKeys.userBusinessType: SharedPreferencesHelper.getString(
        SharedPreferencesKeys.userBusinessType,
      ),
      SharedPreferencesKeys.userPhoneNumber: SharedPreferencesHelper.getString(
        SharedPreferencesKeys.userPhoneNumber,
      ),
    };
  }

  static Future<void> saveUserData(UserData userData) async {
    await SharedPreferencesHelper.setData(
      SharedPreferencesKeys.userName,
      userData.name,
    );
    await SharedPreferencesHelper.setData(
      SharedPreferencesKeys.userId,
      userData.id,
    );
    await SharedPreferencesHelper.setData(
      SharedPreferencesKeys.userBusinessType,
      userData.businessType,
    );

    await SharedPreferencesHelper.setData(
      SharedPreferencesKeys.userAddress,
      userData.address,
    );
    await SharedPreferencesHelper.setData(
      SharedPreferencesKeys.userEmail,
      userData.email,
    );
    await SharedPreferencesHelper.setData(
      SharedPreferencesKeys.userPhoneNumber,
      userData.phone,
    );
  }

  static void clearUserData() {
    Future.wait<void>([
      SharedPreferencesHelper.removeData(SharedPreferencesKeys.userName),
      SharedPreferencesHelper.removeData(SharedPreferencesKeys.userAddress),
      SharedPreferencesHelper.removeData(SharedPreferencesKeys.userEmail),
      SharedPreferencesHelper.removeData(SharedPreferencesKeys.userId),
      SharedPreferencesHelper.removeData(SharedPreferencesKeys.userPhoneNumber),
      SharedPreferencesHelper.removeData(
        SharedPreferencesKeys.userBusinessType,
      ),
      SecuredStorageHelper.removeSecuredData(),
    ]);
  }

  static setViewOnBoardingBool() async {
    await SharedPreferencesHelper.setData(
      SharedPreferencesKeys.isViewedOnboarding,
      true,
    );
  }

  static bool isViewedOnboarding() {
    return SharedPreferencesHelper.getBool(
          SharedPreferencesKeys.isViewedOnboarding,
        ) ??
        false;
  }

  static String? getInitialRoute() {
    final bool isViewedOnboarding = UserDataOperator.isViewedOnboarding();

    if (!isViewedOnboarding) {
      return Routes.onboardingRoute;
    }
    if (isLoggedIn) {
      // return Routes.mainScreenRoute;
      return Routes.mainScreenRoute;
    }
    return Routes.loginRoute;
  }
}
