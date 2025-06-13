import 'package:connect_chain_market/core/helpers/extensions.dart';
import 'package:connect_chain_market/core/helpers/spacing.dart';
import 'package:connect_chain_market/core/routing/routes.dart';
import 'package:connect_chain_market/core/theming/app_text_styles.dart';
import 'package:connect_chain_market/core/theming/colors_helper.dart';
import 'package:connect_chain_market/features/home/data/models/home_model.dart';
import 'package:connect_chain_market/features/home/logic/cubit/home_cubit.dart';
import 'package:connect_chain_market/features/home/ui/widgets/banner_carousel.dart';
import 'package:connect_chain_market/features/home/ui/widgets/category_list.dart';
import 'package:connect_chain_market/features/home/ui/widgets/home_app_bar.dart';
import 'package:connect_chain_market/features/home/ui/widgets/product_grid.dart';
import 'package:connect_chain_market/features/home/ui/widgets/section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Home Screen Widgets
part 'widgets/request_for_qoutation_button.dart';

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
      floatingActionButton: RequestForQoutationButton(),
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
