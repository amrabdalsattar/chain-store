import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UnselectedBottomNavBarItem extends StatelessWidget {
  final String assetPath;
  const UnselectedBottomNavBarItem({
    super.key,
    required this.assetPath,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      assetPath,
      width: 24.w,
      height: 24.h,
      key: ValueKey('unselected $assetPath'),
    );
  }
}
