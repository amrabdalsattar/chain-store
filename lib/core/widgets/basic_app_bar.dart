import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/extensions.dart';
import '../theming/app_text_styles.dart';
import '../theming/colors_helper.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isFirstScreen;
  final Widget? actionWidget;
  const BasicAppBar({
    super.key,
    required this.title,
    this.isFirstScreen = false,
    this.actionWidget,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      actionsPadding: EdgeInsetsDirectional.only(end: 16.w),
      actions: [actionWidget ?? const SizedBox.shrink()],
      leading:
          isFirstScreen
              ? null
              : IconButton(
                icon: const Icon(Icons.arrow_back_ios_sharp),
                onPressed: () => context.pop(),
                iconSize: 20.r,
              ),
      title: Text(title, style: AppTextStyles.rubikBlackBold24),
      centerTitle: true,
      surfaceTintColor: ColorsHelper.white,
      backgroundColor: ColorsHelper.white,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
