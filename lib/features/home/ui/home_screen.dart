import '../../../core/helpers/spacing.dart';

import '../../../core/widgets/custom_search_text_form_field.dart';

import 'widgets/banner_slider.dart';
import 'widgets/home_app_bar.dart';
import 'widgets/request_for_quotation_button.dart';
import 'widgets/section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const RequestForQuotationButton(),
      appBar: const HomeAppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: CustomScrollView(
            slivers: [
              // Search Bar
              const SliverToBoxAdapter(child: CustomSearchTextFormField()),
              SliverToBoxAdapter(child: verticalSpace(24)),

              // Banner
              const SliverToBoxAdapter(child: BannerSlider()),
              SliverToBoxAdapter(child: verticalSpace(15)),

              // Top Suppliers
              SliverToBoxAdapter(
                child: SectionHeader(
                  title: 'Top Suppliers',
                  onSeeAllTap: () {
                    // Navigate to featured products screen
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
