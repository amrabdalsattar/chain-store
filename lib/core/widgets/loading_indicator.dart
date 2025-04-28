import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/colors_helper.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  final Color? color;
  const LoadingIndicator({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 25.w,
        height: 25.h,
        child: CircularProgressIndicator(
          color: color ?? ColorsHelper.primaryColor,
        ),
      ),
    );
  }
}
