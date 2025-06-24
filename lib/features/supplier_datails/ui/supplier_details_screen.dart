import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/theming/app_text_styles.dart';
import '../../../core/theming/colors_helper.dart';
import '../../../core/widgets/basic_app_bar.dart';
import '../../../core/widgets/loading_indicator.dart';
import '../../../core/widgets/shimmer_loading_list.dart';
import '../../home/data/models/suppliers_response_model.dart';
import '../logic/cubit/supplier_products_cubit.dart';
import 'widgets/supplier_products_list_view.dart';

part 'widgets/supplier_details_header.dart';
part 'widgets/supplier_image.dart';
part 'widgets/supplier_products_bloc_builder.dart';

class SupplierDetailsScreen extends StatelessWidget {
  const SupplierDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final supplier =
        ModalRoute.of(context)!.settings.arguments as SupplierDataModel;

    return Scaffold(
      appBar: const BasicAppBar(title: 'Supplier Details'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: SupplierDetailsHeader(supplier: supplier),
            ),
            SliverToBoxAdapter(child: verticalSpace(34)),
            SliverToBoxAdapter(
              child: Text(
                'Products by This Supplier',
                style: AppTextStyles.rubikBlackBold16,
              ),
            ),
            SliverToBoxAdapter(child: verticalSpace(34)),
            const SliverToBoxAdapter(child: SupplierProductsBlocBuilder()),
            SliverToBoxAdapter(child: verticalSpace(20)),
          ],
        ),
      ),
    );
  }
}
