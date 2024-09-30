import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';

class UflRoundedContainer extends StatelessWidget {
  const UflRoundedContainer ({
    super.key,
    this.child,
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.showBorder = true,
    this.radius = UflSizes.cardRadiusLg,
    this.backgroundColor = UflColors.white,
    this.borderColor = UflColors.borderPrimary,
});

  final double? width;
  final double? height;
  final double radius;
  final Widget? child;
  final bool showBorder;
  final Color borderColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Color(0xCCC4DDFB),
            blurRadius: 10,
            offset: Offset(2, 6),
            spreadRadius: 0,
          )
        ],
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }

}