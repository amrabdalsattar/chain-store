import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'chain_store_app.dart';
import 'core/helpers/setup_manager.dart';
import 'core/utils/api_keys.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SetupManager setupManager = SetupManager();

  await setupManager.initialSetup();
  Stripe.publishableKey = ApiKeys.stripePublishableKey;

  runApp(localizationSetup(const ChainStoreApp()));
}

EasyLocalization localizationSetup(Widget myApp) {
  return EasyLocalization(
    supportedLocales: const [Locale('en'), Locale('ar')],
    path: 'assets/translations',
    fallbackLocale: const Locale('en'),
    child: myApp,
  );
}
