part of '../product_details_screen.dart';

class SeeAllReviewButton extends StatelessWidget {
  const SeeAllReviewButton({super.key, required this.product});

  final ProductDetailsResponse product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 20.w),
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          context.pushNamed(
            Routes.rattingScreenRoute,
            arguments: {
              'product': product,
              'cubit': context.read<ProductDetailsCubit>(),
            },
          );
        },
        child: Text(
          'See All Reviews',
          style: AppTextStyles.robotoBlackBold12.copyWith(
            color: ColorsHelper.fadedBlack,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
