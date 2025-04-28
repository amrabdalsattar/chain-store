import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../helpers/spacing.dart';
import '../theming/colors_helper.dart';

class ShimmerLoadingList extends StatelessWidget {
  final int itemCount;
  final double containerWidth;
  final double containerHeight;
  final double listHeight;
  final Axis scrollDirection;
  const ShimmerLoadingList(
      {super.key,
      required this.itemCount,
      required this.containerWidth,
      required this.containerHeight,
      required this.scrollDirection,
      required this.listHeight});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: listHeight,
      child: ListView.separated(
        itemCount: itemCount,
        shrinkWrap: true,
        scrollDirection: scrollDirection,
        itemBuilder: (_, index) => Shimmer.fromColors(
          baseColor: ColorsHelper.shimmerBaseColor,
          highlightColor: ColorsHelper.shimmerHighlightColor,
          child: Container(
            height: containerHeight.h,
            width: containerWidth.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: ColorsHelper.white,
            ),
          ),
        ),
        separatorBuilder: (_, index) => scrollDirection == Axis.horizontal
            ? horizontalSpace(4)
            : verticalSpace(16),
      ),
    );
  }
}
