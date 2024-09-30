import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:united_app/src/constants/text_strings.dart';
import 'package:united_app/src/features/authentication/screens/login/widget/login_divider.dart';
import 'package:united_app/src/features/authentication/screens/login/widget/login_form.dart';
import 'package:united_app/src/features/authentication/screens/login/widget/login_header.dart';
import 'package:united_app/src/features/authentication/screens/login/widget/login_social_icon.dart';
import 'package:united_app/src/utils/helpers/helper_functions.dart';
import '../../../../common_widgets/style/spacing_styles.dart';
import '../../../../constants/sizes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final dark = UflHelperFunction.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: UflSpacingStyle.paddingWidthAppBarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //   Logo Title & Subtitle
              UflLoginHeader(dark: dark),

              /// Form
              const UflLoginForm(),

              ///Divider
              UflDivider(dividerText: UflTexts.orSignInWith.capitalize!),
              const SizedBox(height: UflSizes.spaceBtwSections),
              /// Footer
              const UflSocialButton()
            ],
          ),
        ),
      ),
    );
  }
}




