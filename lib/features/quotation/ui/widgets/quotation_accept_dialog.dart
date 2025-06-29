part of '../screens/quotation_details_screen.dart';



// Accept Dialog Widget
class QuotationAcceptDialog extends StatelessWidget {
  final VoidCallback onAccept;
  const QuotationAcceptDialog({super.key, required this.onAccept});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      backgroundColor: ColorsHelper.white,
      title: Row(
        children: [
          Icon(
            Icons.check_circle,
            color: ColorsHelper.completedOrderBackGroundColor,
            size: 24.w,
          ),
          SizedBox(width: 8.w),
          Text('Accept Quotation', style: AppTextStyles.rubikBlackBold16),
        ],
      ),
      content: Text(
        'Are you sure you want to accept this quotation? This action will notify the supplier and proceed with the order.',
        style: AppTextStyles.rubikBlackRegular14,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            'Cancel',
            style: AppTextStyles.rubikBlackMedium14.copyWith(
              color: ColorsHelper.subText,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: onAccept,
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorsHelper.completedOrderBackGroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          child: Text(
            'Accept',
            style: AppTextStyles.rubikWhiteBold12.copyWith(fontSize: 14.sp),
          ),
        ),
      ],
    );
  }
}
