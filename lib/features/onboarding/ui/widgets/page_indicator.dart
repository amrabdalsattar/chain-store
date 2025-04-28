import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/theming/colors_helper.dart';

class PageIndicator extends StatelessWidget {
  final int length;
  final int activeIndex;

  const PageIndicator({
    super.key,
    required this.length,
    required this.activeIndex,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: length,
      effect: ExpandingDotsEffect(
          expansionFactor: 3.w,
          activeDotColor: ColorsHelper.primaryColor,
          dotColor: ColorsHelper.fadedGray,
          dotHeight: 6.h,
          dotWidth: 6.w,
          paintStyle: PaintingStyle.fill),
    );
  }
}
