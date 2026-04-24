import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodu/common/widgets/login_signup/social_icon.dart';
import 'package:foodu/utils/constants/image_strings.dart';
import 'package:foodu/utils/constants/sizes.dart';
import 'package:foodu/utils/helpers/helper_function.dart';

import '../../../../../utils/popups/loaders.dart';

class TSocialRowButton extends StatelessWidget {
  const TSocialRowButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TSocialIcon(
            image: TImages.facebook,
            onTap: () => TLoaders.warningSnackBar(title: "Not Implemented", message: "Please add Facebook login backend here")),
        const SizedBox(width: TSizes.defaultSpace),
        TSocialIcon(
            image: TImages.google,
            onTap: () => TLoaders.warningSnackBar(title: "Not Implemented", message: "Please add Google login backend here")),
        const SizedBox(width: TSizes.defaultSpace),
        TSocialIcon(
            image: isDark ? TImages.lightAppleLogo : TImages.apple,
            onTap: () => TLoaders.warningSnackBar(title: "Not Implemented", message: "Please add Apple login backend here")),
      ],
    );
  }
}
