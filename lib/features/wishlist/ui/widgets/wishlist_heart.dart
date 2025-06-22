import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/app_images.dart';
import '../../../../core/theming/colors_helper.dart';
import '../../../../core/widgets/loading_indicator.dart';

class WishlistHeart extends StatelessWidget {
  final bool isInWishlist;
  final bool isLoading;
  const WishlistHeart({
    super.key,
    required this.isInWishlist,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20.w,
      height: 20.h,
      child:
          isLoading
              ? const LoadingIndicator(
                color: ColorsHelper.redAccent,
                strokeThickness: 2.5,
              )
              : SvgPicture.asset(
                isInWishlist
                    ? AppImages.selectedHeart
                    : AppImages.unselectedHeart,
                colorFilter: const ColorFilter.mode(
                  ColorsHelper.redAccent,
                  BlendMode.srcIn,
                ),
              ),
    );
  }
}
