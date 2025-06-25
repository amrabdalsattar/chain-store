import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../onboarding/ui/widgets/page_indicator.dart';
import 'banner_item.dart';

class BannerSlider extends StatefulWidget {
  const BannerSlider({super.key});

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: const [BannerItem(), BannerItem(), BannerItem()],
          options: CarouselOptions(
            aspectRatio: 342 / 163,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
            viewportFraction: 1,
            enlargeCenterPage: true,
          ),
        ),
        verticalSpace(8),
        PageIndicator(length: 3, activeIndex: _currentIndex),
      ],
    );
  }
}
