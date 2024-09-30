import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:united_app/src/constants/colors.dart';
import '../../../../../common_widgets/custom_shapes/container/circular_container.dart';
import '../../../../../common_widgets/images/ufl_rounded_image.dart';
import '../../../../../constants/sizes.dart';
import '../../../controllers/home_controller.dart';

class UflBannerSlider extends StatelessWidget {
  const UflBannerSlider({
    super.key, required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, _) => controller.updatePageIndicator(index)),
          items: banners.map((url) => UflRoundedImage(imageUrl: url)).toList(),
        ),
        const SizedBox(height: UflSizes.spaceBtwItems),
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < banners.length; i++)
                  UflCircularContainer(width: 20, height: 4, margin: const EdgeInsets.only(right: 10), backgroundColor: controller.carouselCurrentIndex.value == i ? UflColors.primary : UflColors.grey,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}