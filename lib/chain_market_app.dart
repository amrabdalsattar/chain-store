import 'package:connect_chain_market/core/routing/app_router.dart';
import 'package:connect_chain_market/core/routing/routes.dart';
import 'package:connect_chain_market/core/theming/themes_helper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChainMarketApp extends StatelessWidget {
  const ChainMarketApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390, 844),
      builder:
          (_, child) => MaterialApp(
            locale: Locale("ar"),
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,
            debugShowCheckedModeBanner: false,
            title: 'ChainMarket',
            theme: ThemesHelper.lightTheme,
            onGenerateRoute: AppRouter.generateRoute,
            initialRoute: Routes.onboardingRoute,
          ),
    );
  }
}
