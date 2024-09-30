import 'package:flutter/material.dart';
import '../../../../../constants/colors.dart';


class UflAssetsList extends StatelessWidget {
  const UflAssetsList({
    super.key,
    required this.asset,
  });

  final Map<String, String> asset;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 316.06,
      height: 115.83,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(11.58),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 89.36,
              height: 115.83,
              decoration: const BoxDecoration(
                color: Color(0xFFE9A03F),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(11.58),
                  bottomLeft: Radius.circular(11.58),
                ),
              ),
            ),
          ),
          Positioned(
            left: 14.29,
            top: 83.93,
            child: Text(
              'Id: ${asset['id']}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10.74,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
          ),
          Positioned(
            left: 107.56,
            top: 13.24,
            child: Text(
              asset['name']!,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 13.24,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
          ),
          Positioned(
            left: 107.56,
            top: 37.50,
            child: Text(
              'Brand: ${asset['brand']}',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 13.24,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
          ),
          Positioned(
            left: 107.56,
            top: 60.71,
            child: Text(
              'User: ${asset['user']}',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 13.24,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
          ),
          const Positioned(
            left: 107.56,
            top: 83.93,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Condition: ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13.24,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),

                ],
              ),
            ),
          ),
          Positioned(
            left: 25,
            top: 33.93,
            child: Icon(
              Icons.laptop,
              size: 41.07,
              color: Theme.of(context).brightness == Brightness.light
                  ? UflColors.light// White for light mode
                  : UflColors.dark,
            ),
          ),
          Positioned(
            left: 158.92,
            top: 61.44,
            child: Opacity(
              opacity: 0.40,
              child: Transform(
                transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(-0.19),
                child: Container(
                  width: 294.63,
                  height: 244.63,
                  decoration: const BoxDecoration(
                    color: Color(0x7FE9A03F),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}