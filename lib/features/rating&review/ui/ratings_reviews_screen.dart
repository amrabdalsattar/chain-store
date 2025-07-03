import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/helpers/dialogs_helper.dart';
import '../../../core/helpers/extensions.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/theming/colors_helper.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/custom_button.dart';
import '../../home/ui/sections/product/matched_products/widgets/rating_stars.dart';
import '../../product_details/data/models/product_details_response.dart';
import '../data/models/review_model.dart';
import '../logic/cubit/rating_reviews_cubit.dart';

// parts

part 'widgets/write_review_button.dart';
part 'widgets/rating_display.dart';
part 'widgets/write_review_modal.dart';
part 'widgets/write_comment_modal_buttons_section.dart';
part 'widgets/write_comment_modal_header.dart';
part 'widgets/write_comment_modal_rating_section.dart';
part 'widgets/write_comment_modal_review_section.dart';
part 'widgets/review_list_widget.dart';
part 'widgets/review_item.dart';
part 'widgets/ratting_summary_container.dart';
part 'widgets/ratting_summary_header.dart';
part 'widgets/ratting_summary_widget.dart';
part 'widgets/ratting_bars.dart';
part 'widgets/rating_details.dart';
part 'widgets/write_review_modal_error_message_widget.dart';

class RatingsReviewsScreen extends StatelessWidget {
  final ProductDetailsResponse product;

  const RatingsReviewsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RatingReviewsCubit, RatingReviewsState>(
      listener: (context, state) {
        state.whenOrNull(
          failed: () {
            DialogsHelper.showBasicToast('Error adding new Review');
          },
          success: (_) {
            DialogsHelper.showBasicToast('Review Added Successfuly');
            context.pop();
          },
        );
      },
      buildWhen: (previous, current) => current is addProductReviewSuccess,
      builder: (context, state) {
        ProductDetailsResponse currentProduct;

        if (state is addProductReviewSuccess) {
          currentProduct = state.product;
        } else {
          currentProduct = product;
        }
        return Scaffold(
          backgroundColor: ColorsHelper.homeScaffoldColor,
          appBar: const CustomAppBar(
            title: 'Ratings & Reviews',
            isLeadedByLogo: false,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(16),
                  RatingSummaryWidget(
                    averageRating: currentProduct.averageRating.toDouble(),
                    totalReviews: currentProduct.totalRatings,
                    cubit: context.read<RatingReviewsCubit>(),
                  ),
                  verticalSpace(24),
                  ReviewsListWidget(reviews: currentProduct.reviews ?? []),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
