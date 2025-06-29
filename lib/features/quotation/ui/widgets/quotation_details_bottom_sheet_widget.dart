part of '../screens/quotation_details_screen.dart';




// Contact Options Bottom Sheet Widget
class QuotationDeatilsBottomSheetWidget extends StatelessWidget {
  const QuotationDeatilsBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: ColorsHelper.liteGray,
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
          SizedBox(height: 20.h),
          Text('Contact Supplier', style: AppTextStyles.rubikBlackBold18),
          SizedBox(height: 20.h),
          QuotationContactOption(
            icon: Icons.phone,
            title: 'Call Supplier',
            subtitle: '+1 (555) 123-4567',
            color: ColorsHelper.completedOrderBackGroundColor,
            onTap: () => Navigator.pop(context),
          ),
          SizedBox(height: 12.h),
          QuotationContactOption(
            icon: Icons.email,
            title: 'Send Email',
            subtitle: 'supplier@example.com',
            color: ColorsHelper.bagIconBackGroundColor,
            onTap: () => Navigator.pop(context),
          ),
          SizedBox(height: 12.h),
          QuotationContactOption(
            icon: Icons.chat,
            title: 'Send Message',
            subtitle: 'Chat with supplier',
            color: ColorsHelper.statisticsIconBackGroundColor,
            onTap: () => Navigator.pop(context),
          ),
          verticalSpace(20),
        ],
      ),
    );
  }
}
