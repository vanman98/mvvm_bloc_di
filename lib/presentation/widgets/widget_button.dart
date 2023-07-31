import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WidgetButton extends StatelessWidget {
  const WidgetButton(
      {super.key,
      this.backgroundColor,
      this.borderRadius,
      this.elevation = 0,
      this.onTap,
      this.child,
      this.shadowColor,
      this.enable = true,
      this.padding,
      this.width,
      this.height});

  final bool enable;
  final Color? backgroundColor;
  final Color? shadowColor;
  final double elevation;
  final BorderRadius? borderRadius;
  final VoidCallback? onTap;
  final Widget? child;
  final EdgeInsets? padding;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
      shadowColor: shadowColor,
      color: backgroundColor ?? Theme.of(context).primaryColorDark,
      clipBehavior: Clip.none,
      borderRadius: borderRadius ?? BorderRadius.circular(8),
      child: InkWell(
        borderRadius: borderRadius,
        onTap: enable && onTap != null
            ? () {
                onTap!.call();
              }
            : null,
        child: Container(
          width: width,
          height: height,
          padding:
              padding ?? EdgeInsets.symmetric(horizontal: 20.w, vertical: 13.w),
          child: child,
        ),
      ),
    );
  }
}
