import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/dependency_injection.dart';
import '../../../core/helpers/spacing.dart';

import '../../../core/widgets/custom_search_text_form_field.dart';

import '../data/repos/home_repo.dart';
import '../logic/cubit/home_cubit.dart';
import 'sections/banner/banner_slider.dart';
import 'sections/product/matched_products/widgets/matched_products_bloc_builder.dart';
import 'sections/product/recommended_product/widgets/recommended_products_bloc_builder.dart';
import 'sections/top_suppliers/top_suppliers_bloc_builder.dart';
import 'widgets/home_app_bar.dart';
import 'widgets/request_for_quotation_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeCubit homeCubit;

  Future<void> _fetchHomeData() async {
    Future.microtask(
      () => [
        homeCubit.getSuppliers(),
        homeCubit.getMatchedProducts(),
        homeCubit.getRecommendedProducts(),
      ],
    );
  }

  @override
  void initState() {
    homeCubit = HomeCubit(getIt<HomeRepo>());
    _fetchHomeData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => homeCubit,
      child: Scaffold(
        floatingActionButton: const RequestForQuotationButton(),
        appBar: const HomeAppBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                // Search Bar
                const SliverToBoxAdapter(child: CustomSearchTextFormField()),
                SliverToBoxAdapter(child: verticalSpace(24)),

                // Banner
                const SliverToBoxAdapter(child: BannerSlider()),
                SliverToBoxAdapter(child: verticalSpace(8)),

                // Top Suppliers
                const SliverToBoxAdapter(child: TopSuppliersBlocBuilder()),

                // Matched Products
                const SliverToBoxAdapter(child: MatchedProductsBlocBuilder()),

                const SliverToBoxAdapter(
                  child: RecommendedProductsBlocBuilder(),
                ),
                SliverToBoxAdapter(child: verticalSpace(50)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
