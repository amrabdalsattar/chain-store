import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/app_text_styles.dart';
import '../theming/colors_helper.dart';
import 'custom_back_button.dart';
import 'logo.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key,
      this.hideBackButton = false,
      required this.title,
      this.isLeadedByLogo = true});

  final bool hideBackButton;
  final String title;
  final bool isLeadedByLogo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: isLeadedByLogo ? 30.w : 0),
      child: AppBar(
        surfaceTintColor: ColorsHelper.white,
        toolbarHeight: preferredSize.height,
        leadingWidth: isLeadedByLogo ? 45.w : 0,
        centerTitle: false,
        title: Text(
          title,
          style: AppTextStyles.cairoBlackBold24,
        ),
        actionsPadding: EdgeInsetsDirectional.only(end: 24.w),
        actions: [
          if (!hideBackButton) const CustomBackButton(),
        ],
        leading: isLeadedByLogo ? const Logo(width: 41, height: 51) : null,
        automaticallyImplyLeading: false,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
