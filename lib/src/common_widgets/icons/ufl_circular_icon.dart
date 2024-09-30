import 'package:flutter/material.dart';
import 'package:united_app/src/constants/sizes.dart';
import '../../constants/colors.dart';

class UflCircularIcon extends StatelessWidget {
  const UflCircularIcon({
    super.key,
    this.width,
    this.height,
    this.size = UflSizes.lg,
    required this.icon,
    this.backgroundColor,
    this.onPressed, this.color,
  });

  final double? width, height, size;
  final IconData icon;
  final Color? backgroundColor;
  final Color? color;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor != null
            ? UflColors.black.withOpacity(0.9)
            : UflColors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(onPressed: onPressed, icon: Icon(icon, color: color, size: size)),
    );
  }
}
