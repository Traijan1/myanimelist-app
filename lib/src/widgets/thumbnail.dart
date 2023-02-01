import 'package:flutter/material.dart';

class Thumbnail extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;

  const Thumbnail({
    super.key,
    required this.url,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Image.network(
        fit: BoxFit.scaleDown,
        url,
        width: width,
        height: height,
        cacheWidth: width?.toInt(),
        cacheHeight: height?.toInt(),
        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) return child;

          // if (loadingProgress.expectedTotalBytes != null &&
          //     loadingProgress.cumulativeBytesLoaded == loadingProgress.expectedTotalBytes!) test();

          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        },
      ),
    );
  }
}
