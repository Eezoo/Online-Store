import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../utility/constants.dart';

class CustomNetworkImage extends StatelessWidget {
  final String imageUrl;
  final BoxFit fit;
  final double scale;

  const CustomNetworkImage({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.scale = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    final resolved = resolveImageUrl(imageUrl);

    return CachedNetworkImage(
      imageUrl: resolved,
      fit: fit,
      scale: scale,
      // ❌ عند الخطأ
      errorWidget: (context, url, error) =>
          const Icon(Icons.error, color: Colors.red),
    );
  }
}
