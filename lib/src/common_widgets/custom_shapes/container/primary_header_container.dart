import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import '../curved_edges/curved_edges_widget.dart';
import 'circular_container.dart';

class UflPrimaryHeaderContainer extends StatelessWidget {
  const UflPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return UflCurvedEdgesWidget(
      child: Container(
        color: UflColors.primary,

        child: Stack(
          children: [
            Positioned(top: -150, right: -250, child: UflCircularContainer(backgroundColor: UflColors.textWhite.withOpacity(0.1))),
            Positioned(top: 100, right: -300, child: UflCircularContainer(backgroundColor: UflColors.textWhite.withOpacity(0.1))),
            child,
          ],
        ),
      )
    );
  }
}