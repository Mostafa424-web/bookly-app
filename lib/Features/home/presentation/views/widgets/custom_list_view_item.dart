import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomListViewItem extends StatelessWidget {
  const CustomListViewItem({Key? key, required this.imageUrl})
      : super(key: key);

  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: AspectRatio(
        aspectRatio: 2.5 / 4,
        child: CachedNetworkImage(
          fit: BoxFit.fill,
           imageUrl: imageUrl,
          placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) =>
            const Icon(Icons.error),
        ),
      ),
    );
  }
}
