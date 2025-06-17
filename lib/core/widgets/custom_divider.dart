import 'package:flutter/material.dart';

import '../helpers/spacing.dart';
import '../theming/colors_helper.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(18),
        const Divider(
          color: ColorsHelper.borderGray,
          thickness: 0.5,
          height: 1,
        ),
        verticalSpace(18),
      ],
    );
  }
}
