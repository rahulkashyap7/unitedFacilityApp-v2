import 'package:flutter/material.dart';
import 'package:united_app/src/constants/sizes.dart';

class UflGridLayout extends StatelessWidget {
  const UflGridLayout({
    super.key,
    required this.itemCount,
    this.mainAxisExtent = 288,
    required this.itemBuilder,
  });

  final int itemCount;
  final double? mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
      mainAxisExtent: mainAxisExtent,
        mainAxisSpacing: UflSizes.gridViewSpacing,
        crossAxisSpacing: UflSizes.gridViewSpacing,
      ),
      itemBuilder: itemBuilder,
    );
  }
}
