import 'package:flutter/material.dart';

import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/theming/colors_helper.dart';

class CartAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CartAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('My Cart', style: AppTextStyles.rubikBlackBold24),
      centerTitle: true,
      surfaceTintColor: ColorsHelper.white,
      backgroundColor: ColorsHelper.white,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
