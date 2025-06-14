import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/theming/colors_helper.dart';

class CartAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isFirstScreen;
  const CartAppBar({
    super.key,
    required this.title,
    this.isFirstScreen = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
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
