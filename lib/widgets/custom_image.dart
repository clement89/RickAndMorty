import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rick_morty/widgets/custom_loader.dart';

class CustomImage extends StatelessWidget {
  final String imageUrl;
  const CustomImage({
    required this.imageUrl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      progressIndicatorBuilder: (context, url, downloadProgress) {
        return const Center(
          child: CustomLoader(),
        );
      },
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
