import 'chain_market_app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'core/helpers/setup_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SetupManager setupManager = SetupManager();

  await setupManager.initialSetup();

  runApp(localizationSetup(const ChainMarketApp()));
}

EasyLocalization localizationSetup(Widget myApp) {
  return EasyLocalization(
    supportedLocales: const [Locale('en'), Locale('ar')],
    path: 'assets/translations',
    fallbackLocale: const Locale('en'),
    child: myApp,
  );
}
