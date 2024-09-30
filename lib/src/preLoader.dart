import 'package:flutter/material.dart';

class Preloader extends StatelessWidget {
  const Preloader({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}