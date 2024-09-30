import 'package:flutter/material.dart';

import 'curved_edges.dart';

class UflCurvedEdgesWidget extends StatelessWidget {
  const UflCurvedEdgesWidget({
    super.key, this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: UflCustomCurvedEdges(),
      child: child,
    );
  }
}
