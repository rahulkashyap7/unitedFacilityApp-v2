import 'package:flutter/material.dart';

class UflCustomCurvedEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);

    final  firstCurve = Offset(0, size.height - 20);
    final  lastCurve = Offset(30, size.height - 20);
    path.quadraticBezierTo(firstCurve.dx, firstCurve.dy, lastCurve.dx, lastCurve.dy);

    final  secondFirstCurve = Offset(0, size.height - 20);
    final  secondLastCurve = Offset(size.width-30, size.height-20);
    path.quadraticBezierTo(secondFirstCurve.dx, secondFirstCurve.dy, secondLastCurve.dx, secondLastCurve.dy);

    final  thirdFirstCurved = Offset(size.width, size.height - 20);
    final  thirdSecondCurved = Offset(size.width, size.height);
    path.quadraticBezierTo(thirdFirstCurved.dx, thirdFirstCurved.dy, thirdSecondCurved.dx, thirdSecondCurved.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
   return true;
  }

}