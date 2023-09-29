import 'package:base_getx/presentation/presentation.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';

import '../../data/remote_data/app_endpoint.dart';

enum ImageNetworkShape { none, circle }

class WidgetImageNetwork extends StatelessWidget {
  final String? url;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final ImageNetworkShape? shape;
  final String? assetError;
  final BorderRadius? radius;
  final double? radiusAll;
  final bool isBaseImage;

  const WidgetImageNetwork(
      {super.key,
      @required this.url,
      this.fit,
      this.radiusAll,
      this.height,
      this.width,
      this.radius,
      this.assetError,
      this.shape = ImageNetworkShape.none,
      this.isBaseImage = false});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: radius ?? BorderRadius.all(Radius.circular(radiusAll ?? 0)),
      child: OctoImage(
        image: CachedNetworkImageProvider('${AppEndpoint.BASE_URL_IMAGE}$url'),
        height: height,
        width: width,
        placeholderBuilder: OctoPlaceholder.blurHash('LKO2?U%2Tw=w]~RBVZRi};RPxuwH'),
        errorBuilder: (context, error, stackTrace) => SizedBox(
            width: width,
            height: height,
            child: Image.asset(assetError ?? AssetManager.errorImage, fit: BoxFit.cover)),
        fit: fit ?? BoxFit.cover,
      ),
    );
  }
}
