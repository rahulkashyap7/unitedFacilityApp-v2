import 'package:flutter/material.dart';

class UflCardTitleText extends StatelessWidget {
  const UflCardTitleText(
      {super.key,
      required this.title,
       this.smallSize = false,
       this.maxLines = 2,
      this.textAlign = TextAlign.left,
      });

  final String title;
  final bool smallSize;
  final int maxLines;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Color(0xFF084694),
        fontWeight: FontWeight.bold,
      ),
      // smallSize
      //     ? Theme.of(context).textTheme.labelLarge
      //     : Theme.of(context).textTheme.titleSmall,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
