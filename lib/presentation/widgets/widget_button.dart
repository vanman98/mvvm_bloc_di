import 'package:flutter/material.dart';

class WidgetButton extends StatelessWidget {
  const WidgetButton({
    super.key,
    this.color,
    this.borderRadius = const BorderRadius.only(),
    this.elevation = 0,
    this.onTap,
    this.child,
    this.shadowColor,
    this.enable = true,
  });

  final bool enable;
  final Color? color;
  final Color? shadowColor;
  final double elevation;
  final BorderRadius borderRadius;
  final VoidCallback? onTap;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
      shadowColor: shadowColor,
      color: color ?? Theme.of(context).primaryColorDark,
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
      clipBehavior: Clip.none,
      child: InkWell(
        borderRadius: borderRadius,
        onTap: enable && onTap != null
            ? () {
                onTap!.call();
              }
            : null,
        child: child,
      ),
    );
  }
}
