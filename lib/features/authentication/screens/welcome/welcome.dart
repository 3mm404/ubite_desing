import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodu/common/styles/spacing_styles.dart';
import 'package:foodu/utils/constants/image_strings.dart';
import 'package:foodu/utils/constants/sizes.dart';
import 'package:foodu/utils/constants/text_strings.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/colors.dart';
import '../onboarding/onboarding.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// Timer to call OnBoarding after 3 seconds
    Timer(const Duration(seconds: 3), () => Get.offAll(() => const OnBoardingScreen()));

    /// Use the container to set Background Image
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(image: DecorationImage(fit: BoxFit.cover, image: AssetImage(TImages.welcome))),

      /// Use this Container to add Gradient
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.transparent, Colors.black.withValues(alpha: 0.8)],
          ),
        ),
        child: Padding(
          padding: TSpacingStyles.paddingWithHeightWidth,

          /// Main Content -- Use Column with MainAxisAlignment.end to push it at the bottom
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(TTexts.welcomeTitle, textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineLarge),
              const Gap(TSizes.spaceBtwItems),
              Text(TTexts.welcomeSubtitle,
                  textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.backgroundLight)),
              const Gap(TSizes.defaultSpace + 10),
            ],
          ),
        ),
      ),
    );
  }
}
