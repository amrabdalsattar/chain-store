import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/spacing.dart';
import '../theming/app_text_styles.dart';
import '../theming/colors_helper.dart';

class UploadImageWidget extends StatelessWidget {
  const UploadImageWidget({
    super.key,
    this.onTap,
  });

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: DottedBorder(
        dashPattern: const [8],
        borderType: BorderType.RRect,
        radius: const Radius.circular(8),
        padding: const EdgeInsets.all(6),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          child: SizedBox(
            height: 116.h,
            width: 294.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.cloud_upload_outlined,
                  size: 36,
                ),
                verticalSpace(12),
                Text(
                  'يمكنك اضافه حتي 5 صور',
                  style: AppTextStyles.cairoSemiGreyRegular12
                      .copyWith(color: ColorsHelper.subText),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
