
part of '../screens/quotation_details_screen.dart';


// Custom AppBar Widget
class QuotationDetailsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String status;
  const QuotationDetailsAppBar({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Quotation Details', style: AppTextStyles.rubikBlackBold20),
      centerTitle: true,
      backgroundColor: ColorsHelper.white,
      elevation: 0,
      shadowColor: ColorsHelper.boxShadow,
      surfaceTintColor: ColorsHelper.transparent,
      leading: IconButton(
        icon: Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            color: ColorsHelper.liteGray,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: const Icon(
            Icons.arrow_back_ios_new,
            size: 18,
            color: ColorsHelper.darkGray,
          ),
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      actions: [
        Container(
          margin: EdgeInsets.only(right: 16.w),
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
          decoration: BoxDecoration(
            color: ColorsHelper.pinnedOrderBackGroundColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Text(
            status.toUpperCase(),
            style: AppTextStyles.rubikWhiteBold12.copyWith(
              color: ColorsHelper.pinnedOrderBackGroundColor,
              letterSpacing: 0.5,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}