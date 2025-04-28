import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecuredStorageHelper {
  SecuredStorageHelper._();
  static final FlutterSecureStorage _storage = FlutterSecureStorage(
    aOptions: getAndroidOptions(),
  );

  /// Sets secured string
  static setSecuredString(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  /// Gets secured string
  static getSecuredString(String key) async {
    return await _storage.read(key: key) ?? '';
  }

  /// Removes all secured data
  static removeSecuredData() async {
    await _storage.deleteAll();
  }
}

AndroidOptions getAndroidOptions() => const AndroidOptions(
      encryptedSharedPreferences: true,
      resetOnError: true,
    );
