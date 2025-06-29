part of '../screens/quotation_details_screen.dart';



// Custom Action Buttons Widget
class QuotationActionButtons extends StatelessWidget {
  final VoidCallback onAccept;
  final VoidCallback onDecline;
  final VoidCallback onContact;
  const QuotationActionButtons({
    super.key,
    required this.onAccept,
    required this.onDecline,
    required this.onContact,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: ColorsHelper.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: ColorsHelper.boxShadow.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.how_to_vote, size: 20.w, color: ColorsHelper.subText),
              SizedBox(width: 8.w),
              Text('Review & Decision', style: AppTextStyles.rubikBlackBold16),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: [
                      BoxShadow(
                        color: ColorsHelper.completedOrderBackGroundColor
                            .withOpacity(0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: CustomButton(
                    title: '✓ Accept Quotation',
                    width: double.infinity,
                    color: ColorsHelper.completedOrderBackGroundColor,
                    onTap: onAccept,
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: [
                      BoxShadow(
                        color: ColorsHelper.rejectedOrderBackGroundColor
                            .withOpacity(0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: CustomButton(
                    title: '✗ Decline Quotation',
                    width: double.infinity,
                    color: ColorsHelper.rejectedOrderBackGroundColor,
                    onTap: onDecline,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: ColorsHelper.primaryColor, width: 1.5),
            ),
            child: CustomButton(
              title: '💬 Contact Supplier',
              width: double.infinity,
              color: ColorsHelper.white,
              textColor: ColorsHelper.primaryColor,
              onTap: onContact,
            ),
          ),
        ],
      ),
    );
  }
}