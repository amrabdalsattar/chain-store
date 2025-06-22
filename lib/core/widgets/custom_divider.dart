import 'package:flutter/material.dart';

import '../helpers/spacing.dart';
import '../theming/colors_helper.dart';

class CustomDivider extends StatelessWidget {
  final Color? color;
  final double? thickness;
  final double? height;
  const CustomDivider({super.key, this.color, this.thickness, this.height});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(18),
        Divider(
          color: color ?? ColorsHelper.borderGray,
          thickness: thickness ?? 0.5,
          height: height ?? 0,
        ),
        verticalSpace(18),
      ],
    );
  }
}
