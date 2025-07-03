import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../core/di/dependency_injection.dart';
import '../../../core/helpers/dialogs_helper.dart';
import '../../../core/helpers/extensions.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/routing/routes.dart';
import '../../../core/theming/app_text_styles.dart';
import '../../../core/theming/colors_helper.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_empty_widget.dart';
import '../../../core/widgets/custom_image_widget.dart';
import '../../../core/widgets/loading_indicator.dart';
import '../../cart/logic/cart_cubit/cart_cubit.dart';
import '../../cart/logic/cart_cubit/cart_state.dart';
import '../../home/ui/sections/product/matched_products/widgets/rating_stars.dart';
import '../../wishlist/ui/widgets/wishlist_heart_bloc_listener.dart';
import '../data/models/product_details_response.dart';
import '../logic/cubit/product_details_cubit.dart';
import 'widgets/color_selector.dart';
import 'widgets/expandable_description.dart';
import 'widgets/product_image_carousel.dart';
import 'widgets/quantity_selector.dart';
import 'widgets/size_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Parts of Screen
part 'widgets/product_details_content.dart';
part 'widgets/product_details_info_section.dart';
part 'widgets/size_selector_section.dart';
part 'widgets/color_selector_section.dart';
part 'widgets/quantity_selector_section.dart';
part 'widgets/comment_section.dart';
part 'widgets/description_section.dart';
part 'widgets/ratting_section.dart';
part 'widgets/product_details_buttons_section.dart';
part 'widgets/cart_button.dart';
part 'widgets/see_all_review_button.dart';

class ProductDetailsScreen extends StatelessWidget {
  final int productId;

  const ProductDetailsScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              ProductDetailsCubit(getIt())..fetchProductDetails(productId),
      child: Scaffold(
        body: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
          buildWhen: (previous, current) => current is! AttributeChanged,
          builder: (context, state) {
            return state.mapOrNull(
                  loading: (_) => const LoadingIndicator(),
                  error: (error) => CustomEmptyWidget(message: error.message),
                  initial: (_) => const LoadingIndicator(),
                  attributeChanged: (_) => const SizedBox.shrink(),
                  loaded:
                      (data) => ProductDetailsContent(
                        product: data.prodcut,
                        productId: productId,
                      ),
                ) ??
                const SizedBox();
          },
        ),
      ),
    );
  }
}
