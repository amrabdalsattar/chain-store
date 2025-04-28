import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {super.key,
      required this.iconPath,
      this.onTap,
      this.width,
      this.height,
      this.fit});

  final String iconPath;
  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: width ?? 18.w,
        height: height ?? 18.h,
        child: SvgPicture.asset(
          iconPath,
          fit: fit ?? BoxFit.cover,
        ),
      ),
    );
  }
}
