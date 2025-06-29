part of '../screens/quotation_details_screen.dart';




// Custom Header Card Widget
class QuotationHeaderCard extends StatelessWidget {
  final QuotationModel quotation;
  const QuotationHeaderCard({super.key, required this.quotation});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            ColorsHelper.primaryColor,
            ColorsHelper.profileHeaderGradientEnd,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: ColorsHelper.primaryColor.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: ColorsHelper.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                  Icons.description,
                  color: ColorsHelper.white,
                  size: 24.w,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Quote #${quotation.id + 1}',
                      style: AppTextStyles.rubikWhiteBold14.copyWith(
                        fontSize: 18.sp,
                      ),
                    ),
                    Text(
                      'RFQ Quotation Details',
                      style: AppTextStyles.rubikWhiteMedium16.copyWith(
                        fontSize: 14.sp,
                        color: ColorsHelper.white.withOpacity(0.9),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: ColorsHelper.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Text(
              'Total Value: \$${quotation.unitPrice}',
              style: AppTextStyles.rubikWhiteMedium16.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
