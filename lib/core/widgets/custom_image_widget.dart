import 'package:cached_network_image/cached_network_image.dart';
import 'custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomImageWidget extends StatelessWidget {
  const CustomImageWidget({
    super.key,
    required this.imageUrl,
    this.height = 56.0,
    this.width = 56.0,
    this.borderRadius = 8.0,
    this.placeholder,
    this.errorWidget,
    this.fit = BoxFit.cover,
    this.onTap,
  });

  final String imageUrl;
  final double height;
  final double width;
  final double borderRadius;
  final Widget? placeholder;
  final Widget? errorWidget;
  final BoxFit fit;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Hero(
          tag: imageUrl,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius.r),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              placeholder: (_, __) =>
                  placeholder ??
                  Padding(
                      padding: EdgeInsets.all(16.r),
                      child: const FittedBox(child: CustomLoadingIndicator())),
              errorWidget: (_, __, ___) =>
                  errorWidget ?? const Icon(Icons.broken_image),
              height: height.h,
              width: width.w,
              fit: fit,
            ),
          ),
        ),
      ),
    );
  }
}
