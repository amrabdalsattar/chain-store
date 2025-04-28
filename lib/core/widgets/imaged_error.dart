import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../helpers/app_images.dart';
import '../helpers/spacing.dart';
import '../theming/app_text_styles.dart';

class ImagedError extends StatelessWidget {
  final String? imagePath;
  final String errorMessage;
  const ImagedError({
    super.key,
    this.imagePath = AppImages.generalErrorImage,
    required this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            imagePath!,
            height: MediaQuery.of(context).size.height * 0.25,
          ),
          verticalSpace(40),
          Text(
            errorMessage,
            // style: AppTextStyles.cairoBlackSemiBold16,
          ),
        ],
      ),
    );
  }
}
