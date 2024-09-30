import 'package:flutter/material.dart';

import '../../../../../common_widgets/appbar/appbar.dart';
import '../../../../../common_widgets/notification_icon/notification_icon.dart';
import '../../../../../constants/colors.dart';
import '../../../../../constants/text_strings.dart';

class UflHomeAppBar extends StatelessWidget {
  const UflHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return UflAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(UflTexts.homeAppBarTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: UflColors.grey)),
          Text(UflTexts.homeAppBarSubTitle, style: Theme.of(context).textTheme.headlineSmall!.apply(color: UflColors.white)),
        ],
      ),
      actions: [
        UflNotificationIcon(onPressed: () {}, iconColor: UflColors.white)
      ],
    );
  }
}