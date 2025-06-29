part of '../screens/new_quotation_screen.dart';

class NewQuotationScreenContent extends StatelessWidget {
  const NewQuotationScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<QuotationCubit>();

    return Scaffold(
      backgroundColor: ColorsHelper.black,

      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              'Request for Quotation',
              style: AppTextStyles.rubikBlackBold24,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 120.h,
              color: ColorsHelper.black,
              child: Padding(
                padding: EdgeInsets.only(left: 31.w, top: 18.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Get quotes from matching suppliers',
                      style: AppTextStyles.robotoWhiteBold16,
                    ),
                    Text(
                      'Detailed requirements lead to more accurate quotes',
                      style: AppTextStyles.robotoBlackRegular12.copyWith(
                        color: ColorsHelper.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          RFQFormSection(cubit: cubit),
        ],
      ),
    );
  }
}
