import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/app_images.dart';

class Logo extends StatelessWidget {
  final double width;
  final double height;
  const Logo({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.connectChainLogo,
      width: width.w,
      height: height.h,
    );
  }
}
