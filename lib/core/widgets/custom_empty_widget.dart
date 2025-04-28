import 'package:cached_network_image/cached_network_image.dart';
import '../theming/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomEmptyWidget extends StatelessWidget {
  const CustomEmptyWidget({
    super.key,
    required this.message,
    this.imageUrl,
    this.imageHeight = 150.0,
    this.imageWidth = 150.0,
  });

  final String message;
  final String? imageUrl;
  final double imageHeight;
  final double imageWidth;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (imageUrl != null)
            CachedNetworkImage(
              imageUrl: imageUrl!,
              height: imageHeight,
              width: imageWidth,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          const SizedBox(height: 16),
          Text(
            message,
            style: AppTextStyles.robotoBlackSemiBold16,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
