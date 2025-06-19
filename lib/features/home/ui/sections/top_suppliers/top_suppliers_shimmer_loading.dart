import 'package:flutter/material.dart';

import '../../../../../core/widgets/shimmer_loading_list.dart';

class TopSuppliersShimmerLoading extends StatelessWidget {
  const TopSuppliersShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const ShimmerLoadingList(
      itemCount: 5,
      containerWidth: 145,
      containerHeight: 151,
      scrollDirection: Axis.horizontal,
      listHeight: 151,
    );
  }
}
