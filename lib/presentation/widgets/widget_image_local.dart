import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../resource/asset_manager.dart';

class WidgetImageLocal extends StatelessWidget {
  final String asset;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit fit;
  final String? package;
  final double? scale;
  const WidgetImageLocal(this.asset,
      {super.key,
      this.width,
      this.height,
      this.color,
      this.fit = BoxFit.contain,
      this.package,
      this.scale});

  @override
  Widget build(BuildContext context) {
    return asset.contains('.svg')
        ? SvgPicture.asset(
            AssetManager.svg(asset),
            package: package,
            width: width,
            height: height,
            fit: fit,
            colorFilter: color != null
                ? ColorFilter.mode(color!, BlendMode.srcIn)
                : null,
          )
        : Image.asset(
            asset,
            package: package,
            width: width,
            height: height,
            fit: fit,
            scale: scale,
          );
  }
}
