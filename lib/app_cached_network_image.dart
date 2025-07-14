import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppCachedNetworkImage extends StatelessWidget {
  final Widget? loadingWidget;
  final Widget? errorWidget;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final double radius;
  final String imageUrl;
  final String name;

  const AppCachedNetworkImage({
    super.key,
    required this.imageUrl,
    required this.radius,
    this.loadingWidget,
    this.errorWidget,
    this.fit,
    this.height,
    this.width,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          child: CachedNetworkImage(
            height: height,
            width: width,
            fit: fit,
            imageUrl: imageUrl,
            placeholder: (context, url) => loadingWidget ?? const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => errorWidget ?? const Icon(Icons.error),
          ),
        ),
        Divider(),
        Center(child: Text(name)),
      ],
    );
  }
}
