import 'package:flutter/material.dart';
import '../../../../../common_widgets/image_text_widget/vertical_image_text.dart';
import '../../../../../constants/image_strings.dart';


class UflHomeCategories extends StatelessWidget {
  const UflHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return UflVerticalImageText(image: UflImages.attendanceIcon, title: 'Attendance', onTap: () {},);
        },
      ),
    );
  }
}