import 'core/helpers/cache/user_data_operator.dart';
import 'core/routing/app_router.dart';
import 'core/theming/themes_helper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChainStoreApp extends StatelessWidget {
  const ChainStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390, 844),
      builder:
          (_, child) => MaterialApp(
            locale: Locale("en"),
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,
            debugShowCheckedModeBanner: false,
            title: 'ChainStore',
            theme: ThemesHelper.lightTheme,
            onGenerateRoute: AppRouter.generateRoute,
            initialRoute: UserDataOperator.getInitialRoute(),
          ),
    );
  }
}
