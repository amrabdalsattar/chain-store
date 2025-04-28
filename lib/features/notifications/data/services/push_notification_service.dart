import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../pre_login/data/datasources/pre_login_datasource.dart';
import '../../../pre_login/data/repos/pre_login_repo.dart';
import 'local_notification_service.dart';

class PushNotificationService {
  static final FirebaseMessaging _firebaseMessaging =
      FirebaseMessaging.instance;
  static final PreLoginRepo _preLoginRepo = PreLoginRepo(
    getIt<PreLoginDatasource>(),
  );

  static Future<void> init() async {
    try {
      await Firebase.initializeApp();
      _firebaseMessaging.setAutoInitEnabled(true);

      await _firebaseMessaging.requestPermission();
      String? token = await _firebaseMessaging.getToken();

      log(token ?? 'null token');

      _setupTokenRefreshListener();

      // Background
      FirebaseMessaging.onBackgroundMessage(_handleBackgroundMessage);

      _firebaseMessaging.onTokenRefresh.listen((token) async {
        await _preLoginRepo.updateFCMToken(token);
      });

      // Foreground
      await _handleForegroundMessage();
    } catch (error) {
      log('Error initializing push notifications: $error');
    }
  }

  static Future<void> _handleForegroundMessage() async {
    FirebaseMessaging.onMessage.listen((message) {
      LocalNotificationService.showBasicNotification(message);
    });
  }

  static void _setupTokenRefreshListener() {
    _firebaseMessaging.onTokenRefresh.listen((newToken) async {
      await _preLoginRepo.updateFCMToken(newToken);
    });
  }

  static Future<void> _handleBackgroundMessage(RemoteMessage message) async {
    await Firebase.initializeApp();
    log(message.notification?.title ?? 'null message');
  }
}
