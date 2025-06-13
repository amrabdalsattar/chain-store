import '../../../core/helpers/extensions.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/routing/routes.dart';
import '../../../core/theming/colors_helper.dart';
import '../data/models/home_model.dart';
import '../logic/cubit/home_cubit.dart';
import 'widgets/banner_carousel.dart';
import 'widgets/category_list.dart';
import 'widgets/home_app_bar.dart';
import 'widgets/product_grid.dart';
import 'widgets/request_for_quotation_button.dart';
import 'widgets/section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..loadHomeData(),
      child: const _HomeScreenContent(),
    );
  }
}

class _HomeScreenContent extends StatelessWidget {
  const _HomeScreenContent();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsHelper.homeScaffoldColor,
      floatingActionButton: const RequestForQuotationButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (message) => Center(child: Text('Error: $message')),
            loaded: (homeData) => _buildLoadedContent(context, homeData),
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }

  Widget _buildLoadedContent(BuildContext context, HomeModel homeData) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          // App Bar
          const SliverToBoxAdapter(child: HomeAppBar()),

          // Banner Carousel
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: BannerCarousel(banners: homeData.banners),
            ),
          ),

          // Categories
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: SectionHeader(
                title: 'Categories',
                onSeeAllTap: () {
                  Navigator.pushNamed(context, Routes.categoriesScreenRoute);
                },
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: CategoryList(categories: homeData.categories),
          ),

          // Featured Products
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: SectionHeader(
                title: 'Featured Products',
                onSeeAllTap: () {
                  // Navigate to featured products screen
                },
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: ProductGrid(
              products: homeData.featuredProducts,
              onProductTap: (product) {
                context.pushNamed(
                  Routes.productDetailsRoute,
                  arguments: product,
                );
              },
            ),
          ),

          // New Arrivals
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: SectionHeader(
                title: 'New Arrivals',
                onSeeAllTap: () {
                  // Navigate to new arrivals screen
                },
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: ProductGrid(
              products: homeData.newArrivals,
              onProductTap: (product) {
                Navigator.pushNamed(
                  context,
                  Routes.productDetailsRoute,
                  arguments: product,
                );
              },
            ),
          ),

          // Bottom spacing
          SliverToBoxAdapter(child: verticalSpace(24.h)),
        ],
      ),
    );
  }
}
