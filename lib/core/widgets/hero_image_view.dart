import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_view/photo_view.dart';

import 'custom_loading_indicator.dart';

class HeroImageView extends StatelessWidget {
  final String imageUrl;

  const HeroImageView({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: imageUrl,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height,
        ),
        child: PhotoView(
          imageProvider: CachedNetworkImageProvider(imageUrl),
          backgroundDecoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          loadingBuilder: (context, event) {
            return Padding(
              padding: EdgeInsets.all(16.r),
              child: const CustomLoadingIndicator(),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return const Icon(Icons.broken_image, color: Colors.white);
          },
        ),
      ),
    );
  }
}
