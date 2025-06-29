
part of '../screens/rfq_screen.dart';

class CustomRFQSection extends StatelessWidget {
  const CustomRFQSection({
    super.key,
    required this.title,
    required this.iconPath,
    this.description,
  });
  final String title;
  final String iconPath;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
      width: 342.w,
      decoration: BoxDecoration(
        color: ColorsHelper.liteGray,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.timelapse_sharp, size: 22.w),
              horizontalSpace(8),
              Expanded(
                child: Text(title, style: AppTextStyles.robotoBlackBold14),
              ),
            ],
          ),
          description != null
              ? Row(
                children: [
                  horizontalSpace(30),
                  Expanded(
                    child: Text(
                      description!,
                      style: AppTextStyles.robotoBlackRegular12.copyWith(
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ],
              )
              : const SizedBox(),
        ],
      ),
    );
  }
}
