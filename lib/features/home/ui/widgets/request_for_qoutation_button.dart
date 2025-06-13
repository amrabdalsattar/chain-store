
part of '../home_screen.dart';

class RequestForQoutationButton extends StatelessWidget {
  const RequestForQoutationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(Routes.quotationScreenRoute);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 19.h),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: ColorsHelper.boxShadow, blurRadius: 24.r),
          ],
          color: ColorsHelper.primaryColor,
          borderRadius: BorderRadius.circular(32.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.edit_outlined, color: ColorsHelper.white),
            horizontalSpace(2.5),
            Text(
              'Request For Qoutation',
              style: AppTextStyles.rubikWhiteBold14,
            ),
          ],
        ),
      ),
    );
  }
}
