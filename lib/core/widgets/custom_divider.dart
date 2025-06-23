import 'package:flutter/material.dart';

import '../helpers/spacing.dart';
import '../theming/colors_helper.dart';

class CustomDivider extends StatelessWidget {
  final Color? color;
  final double? thickness;
  final double? height;
  final bool haveSpace;
  const CustomDivider({
    super.key,
    this.color,
    this.thickness,
    this.height,
    this.haveSpace = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        haveSpace ? verticalSpace(18) : const SizedBox.shrink(),
        Divider(
          color: color ?? ColorsHelper.borderGray,
          thickness: thickness ?? 0.5,
          height: height ?? 0,
        ),
        haveSpace ? verticalSpace(18) : const SizedBox.shrink(),
      ],
    );
  }
}
