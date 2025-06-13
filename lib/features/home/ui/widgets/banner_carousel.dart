import 'package:connect_chain_market/core/theming/app_text_styles.dart';
import 'package:connect_chain_market/core/theming/colors_helper.dart';
import 'package:connect_chain_market/features/home/data/models/home_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerCarousel extends StatefulWidget {
  final List<BannerModel> banners;

  const BannerCarousel({super.key, required this.banners});

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    // Auto-scroll the banner
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        _startAutoScroll();
      }
    });
  }

  void _startAutoScroll() {
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        if (_currentPage < widget.banners.length - 1) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        _startAutoScroll();
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 180.h,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.banners.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              final banner = widget.banners[index];
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: Stack(
                    children: [
                      // Banner Image
                      Image.network(
                        'https://www.pngall.com/wp-content/uploads/2018/04/Clothing-PNG-Image-File.png',
                        width: double.infinity,
                        height: 180.h,
                        fit: BoxFit.cover,
                      ),
                      // Banner Content
                      Container(
                        padding: EdgeInsets.all(16.w),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Colors.black.withOpacity(0.6),
                              Colors.transparent,
                            ],
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              banner.title,
                              style: AppTextStyles.rubikBlackBold18.copyWith(
                                color: ColorsHelper.white,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              banner.description,
                              style: AppTextStyles.rubikBlackMedium14.copyWith(
                                color: ColorsHelper.white,
                              ),
                            ),
                            SizedBox(height: 16.h),
                            ElevatedButton(
                              onPressed: () {
                                // Navigate to banner details
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ColorsHelper.primaryColor,
                                foregroundColor: ColorsHelper.white,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16.w,
                                  vertical: 8.h,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                              ),
                              child: const Text('Shop Now'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 8.h),
        // Indicator
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.banners.length,
            (index) => Container(
              width: 8.w,
              height: 8.h,
              margin: EdgeInsets.symmetric(horizontal: 4.w),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                    _currentPage == index
                        ? ColorsHelper.primaryColor
                        : ColorsHelper.primaryColor.withOpacity(0.3),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
