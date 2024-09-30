import 'package:flutter/material.dart';
import '../../constants/sizes.dart';


class UflRoundedImage extends StatelessWidget {
  const UflRoundedImage({
    super.key,
    this.border,
    this.padding,
    this.onPressed,
    this.width,
    this.height,
    this.applyImageRadius = false,
    required this.imageUrl,
    this.fit = BoxFit.contain,
    this.isNetworkImage = false,
    this.borderRadius = UflSizes.md,
  });

  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Positioned(
        right: 67,
        bottom: 50,
        child: Container(
          width: width,
          height: height,
          padding: padding,
          decoration:
          BoxDecoration(border: border ,borderRadius: BorderRadius.circular(borderRadius)),
          child: ClipRRect(
              borderRadius: applyImageRadius ?  BorderRadius.circular(borderRadius) : BorderRadius.zero,
              child: Image(fit: fit, image: isNetworkImage ? NetworkImage(imageUrl) : AssetImage(imageUrl) as ImageProvider)),
        ),
      ),
    );
  }
}
