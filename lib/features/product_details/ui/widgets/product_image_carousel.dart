import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/custom_image_widget.dart';
import '../../../../core/widgets/loading_indicator.dart';

class ProductImageCarousel extends StatefulWidget {
  final List<String> images;

  const ProductImageCarousel({super.key, required this.images});

  @override
  State<ProductImageCarousel> createState() => _ProductImageCarouselState();
}

class _ProductImageCarouselState extends State<ProductImageCarousel> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 250.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorsHelper.backgroundScaffoldColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(190.r),
              bottomRight: Radius.circular(190.r),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.images.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      bottom: 63.h,
                      left: 66.w,
                      right: 66.w,
                    ),
                    width: double.infinity,
                    child: Center(
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: CustomImageWidget(
                          onTap: () {
                            context.pushNamed(
                              Routes.heroImageView,
                              arguments: widget.images[index],
                            );
                          },
                          placeholder: const LoadingIndicator(
                            strokeThickness: 2,
                          ),
                          imageUrl: widget.images[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  // Navigation arrows
                  if (widget.images.length > 1)
                    Positioned.fill(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Row(
                          children: [
                            // Previous button
                            if (_currentIndex > 0)
                              GestureDetector(
                                onTap: () {
                                  _pageController.previousPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.all(8.r),
                                  decoration: const BoxDecoration(
                                    color: ColorsHelper.backgroundScaffoldColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    color: ColorsHelper.black,
                                    size: 16.r,
                                  ),
                                ),
                              ),
                            const Spacer(),
                            // Next button
                            if (_currentIndex < widget.images.length - 1)
                              GestureDetector(
                                onTap: () {
                                  _pageController.nextPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 16.w),
                                  padding: EdgeInsets.all(8.r),
                                  decoration: const BoxDecoration(
                                    color: ColorsHelper.backgroundScaffoldColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: ColorsHelper.black,
                                    size: 16.r,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
        verticalSpace(16),
        Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              widget.images.length,
              (index) => GestureDetector(
                onTap: () {
                  _pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 4.w),
                  height: 8.h,
                  width: _currentIndex == index ? 24.w : 8.w,
                  decoration: BoxDecoration(
                    color:
                        _currentIndex == index
                            ? ColorsHelper.primaryColor
                            : ColorsHelper.borderGray,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
