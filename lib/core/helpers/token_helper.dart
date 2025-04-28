import 'cache/secured_storage_helper.dart';
import 'cache/shared_preferences_keys.dart';
import 'extensions.dart';

bool isLoggedIn = false;

abstract class TokenHelper {
  static getSecuredUserToken() async {
    return await SecuredStorageHelper.getSecuredString(
        SharedPreferencesKeys.userToken);
  }

  static setSecuredUserToken(String token) async {
    await SecuredStorageHelper.setSecuredString(
        SharedPreferencesKeys.userToken, token);
  }

  static Future<void> saveUserToken(String token) async {
    await TokenHelper.setSecuredUserToken(token);
  }

  static checkIfUserIsLoggedIn() async {
    String? userToken = await getSecuredUserToken();

    if (!userToken.isNullOrEmpty()) {
      isLoggedIn = true;
    } else {
      isLoggedIn = false;
    }
  }
}
