import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/notifications/data/services/local_notification_service.dart';
import '../../features/notifications/data/services/push_notification_service.dart';
import '../../firebase_options.dart';
import '../di/dependency_injection.dart';
import '../theming/colors_helper.dart';
import '../utils/app_bloc_observer.dart';
import 'cache/shared_preferences_helper.dart';
import 'token_helper.dart';

class SetupManager {
  Future<void> initialSetup() async {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: ColorsHelper.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    await _initFirebase();
    await SharedPreferencesHelper.init();

    await Future.wait<void>([
      setUpGetIt(),
      EasyLocalization.ensureInitialized(),
      TokenHelper.checkIfUserIsLoggedIn(),
      ScreenUtil.ensureScreenSize(),
    ]);

    Future.wait([
      LocalNotificationService.init(),
      PushNotificationService.init(),
    ]);

    Bloc.observer = AppBlocObserver();
  }

  Future<void> _initFirebase() async {
    final options = DefaultFirebaseOptions.currentPlatform;

    try {
      final app = await Firebase.initializeApp(options: options);

      debugPrint("App Name${app.name}");
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
