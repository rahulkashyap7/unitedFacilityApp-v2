import 'package:flutter/material.dart';
import 'package:united_app/src/constants/colors.dart';

class UflShadowStyle {
  static final verticalCardShadow = BoxShadow(
    color: UflColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2)
  );

  static final horizontalCardShadow = BoxShadow(
      color: UflColors.darkGrey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2)
  );
}