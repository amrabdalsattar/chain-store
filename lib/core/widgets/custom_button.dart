import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../helpers/app_images.dart';
import '../theming/app_text_styles.dart';
import '../theming/colors_helper.dart';
import 'loading_indicator.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final double width;
  final bool isArrowed;
  final double? height;
  final double elevation;
  final bool isLoading;
  final bool isEnabled;
  final Color? color;
  final TextStyle? textStyle;
  final Color? borderColor;
  final double? radius;
  final Color loadingIndicatorColor;

  const CustomButton({
    super.key,
    required this.title,
    required this.width,
    this.onTap,
    this.elevation = 0,
    this.isLoading = false,
    this.isEnabled = true,
    this.color,
    this.textStyle,
    this.borderColor,
    this.radius,
    this.height,
    this.isArrowed = false,
    this.loadingIndicatorColor = ColorsHelper.white,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isEnabled && !isLoading ? onTap : null,
      child: Container(
        height: height == null ? 50.h : height!.h,
        width: width,
        decoration: BoxDecoration(
          color:
              isEnabled
                  ? (color ?? ColorsHelper.primaryColor)
                  : ColorsHelper.borderGray,
          borderRadius: BorderRadius.circular(radius?.r ?? 8.r),
          border: Border.all(
            color: borderColor ?? ColorsHelper.borderGray,
            width: 1.5,
          ),
          boxShadow:
              isEnabled
                  ? [
                    BoxShadow(
                      color: Colors.black.withValues(
                        alpha: elevation == 0 ? 0 : 0.25,
                      ),
                      blurRadius: elevation,
                      spreadRadius: 1,
                      offset: Offset(0, elevation / 2),
                    ),
                  ]
                  : [],
        ),
        child:
            isLoading
                ? LoadingIndicator(color: loadingIndicatorColor)
                : Center(
                  child:
                      isArrowed
                          ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                title,
                                style:
                                    textStyle ??
                                    (isEnabled
                                        ? AppTextStyles.robotoWhiteBold16
                                        : AppTextStyles.robotoWhiteBold16
                                            .copyWith(
                                              color:
                                                  ColorsHelper.semiOpacityBlack,
                                            )),
                              ),
                              SvgPicture.asset(AppImages.proceedArrow),
                            ],
                          )
                          : Text(
                            title,
                            style:
                                textStyle ??
                                (isEnabled
                                    ? AppTextStyles.robotoWhiteBold16
                                    : AppTextStyles.robotoWhiteBold16.copyWith(
                                      color: ColorsHelper.semiOpacityBlack,
                                    )),
                          ),
                ),
      ),
    );
  }
}
