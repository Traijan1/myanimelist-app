import 'package:flutter/material.dart';

class Thumbnail extends StatelessWidget {
  final String url;
  final double? width;

  const Thumbnail({
    super.key,
    required this.url,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Image.network(
        url,
        width: width,
        cacheWidth: width?.toInt(),
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
