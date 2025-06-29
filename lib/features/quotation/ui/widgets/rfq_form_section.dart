part of '../screens/new_quotation_screen.dart';

class RFQFormSection extends StatelessWidget {
  const RFQFormSection({super.key, required this.cubit});

  final QuotationCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        decoration: BoxDecoration(
          color: ColorsHelper.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32.r),
            topRight: Radius.circular(32.r),
          ),
        ),
        padding: EdgeInsets.only(left: 23.w, top: 32.h, right: 47.w),
        child: RFQForm(cubit: cubit),
      ),
    );
  }
}
