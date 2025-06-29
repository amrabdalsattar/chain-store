part of '../screens/rfq_screen.dart';

class RFQScreenContent extends StatelessWidget {
  const RFQScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    final quotationCubit = context.read<QuotationCubit>();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                horizontalSpace(21),

                InkWell(
                  onTap: () => context.pop(),
                  child: Icon(
                    Icons.arrow_back_ios_sharp,
                    size: 20.w,
                    color: ColorsHelper.black,
                  ),
                ),
                horizontalSpace(41),
                Text(
                  'Request For Quotation',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            verticalSpace(64.h),
            Image.asset(
              AppImages.rfqImage,
              width: 390.w,
              height: 154.h,
              fit: BoxFit.contain,
            ),
            verticalSpace(16),
            Text(
              'Request for Quotation',
              style: AppTextStyles.robotoBlackBold14.copyWith(fontSize: 18.sp),
            ),
            verticalSpace(8),
            Text(
              'Get the best price for your products and services',
              style: AppTextStyles.robotoBlackRegular12,
              textAlign: TextAlign.center,
            ),
            verticalSpace(16),
            const CustomRFQSection(
              title: 'Recieve multiple qoutes in 6 hours ',
              iconPath: '',
            ),
            verticalSpace(16),
            const CustomRFQSection(
              title: 'Fast Price Comparison',
              iconPath: '',
              description:
                  'Finalize detialse with suppliers who meet your exact needs in “My RFQ”',
            ),
            verticalSpace(40),
            CustomButton(
              elevation: 5,
              title: 'Submit new RFQ',
              width: 342.w,
              onTap: () {
                context.pushNamed(
                  Routes.newQuotationScreenRoute,
                  arguments: quotationCubit,
                );
              },
            ),
            verticalSpace(12),
            CustomButton(
              onTap: () {
                context.pushNamed(
                  Routes.manageRfQsScreenRoute,
                  arguments: quotationCubit,
                );
              },
              elevation: 5,
              title: 'Manage "My RFQs"',
              width: 342.w,
              radius: 12,
              color: ColorsHelper.white,
              textColor: ColorsHelper.black,
              borderColor: ColorsHelper.black,
            ),
          ],
        ),
      ),
    );
  }
}
