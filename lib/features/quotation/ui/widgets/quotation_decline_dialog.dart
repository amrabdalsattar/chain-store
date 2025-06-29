part of '../screens/quotation_details_screen.dart';


// Decline Dialog Widget
class QuotationDeclineDialog extends StatelessWidget {
  final VoidCallback onDecline;
  const QuotationDeclineDialog({super.key, required this.onDecline});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      backgroundColor: ColorsHelper.white,
      title: Row(
        children: [
          Icon(
            Icons.cancel,
            color: ColorsHelper.rejectedOrderBackGroundColor,
            size: 24.w,
          ),
          SizedBox(width: 8.w),
          Text('Decline Quotation', style: AppTextStyles.rubikBlackBold16),
        ],
      ),
      content: Text(
        'Are you sure you want to decline this quotation? This action will notify the supplier.',
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
          onPressed: onDecline,
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorsHelper.rejectedOrderBackGroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          child: Text(
            'Decline',
            style: AppTextStyles.rubikWhiteBold12.copyWith(fontSize: 14.sp),
          ),
        ),
      ],
    );
  }
}