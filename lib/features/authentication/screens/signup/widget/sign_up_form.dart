import 'package:flutter/material.dart';
import 'package:foodu/common/widgets/login_signup/phone_number_field.dart';
import 'package:foodu/utils/constants/colors.dart';
import 'package:foodu/utils/constants/sizes.dart';
import 'package:foodu/utils/constants/text_strings.dart';
import 'package:foodu/utils/helpers/helper_function.dart';
import 'package:get/get.dart';

import '../../otp/otp_screen.dart';

class TSignUpForm extends StatelessWidget {
  const TSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);

    /// Form
    return Form(
      child: Padding(
        padding: const EdgeInsets.only(top: TSizes.spaceBtwSection),
        child: Column(
          children: [
            /// Phone Number
            const TPhoneNumberField(),
            const SizedBox(height: TSizes.sm),

            /// Email
            SizedBox(
              height: TSizes.textFieldHeight,
              child: TextFormField(
                cursorHeight: TSizes.lg,
                cursorColor: TColors.primary,
                textAlignVertical: TextAlignVertical.bottom,
                style: Theme.of(context).textTheme.bodySmall,
                decoration: InputDecoration(
                  hintText: TTexts.email,
                  prefixIcon: const Icon(Icons.email),
                  hintStyle: Theme.of(context).textTheme.titleSmall,
                  fillColor: isDark ? TColors.darkCard : TColors.textFieldFillColor,
                ),
              ),
            ),
            const SizedBox(height: TSizes.sm),

            /// Full Name
            SizedBox(
              height: TSizes.textFieldHeight,
              child: TextFormField(
                cursorHeight: TSizes.lg,
                cursorColor: TColors.primary,
                textAlignVertical: TextAlignVertical.bottom,
                style: Theme.of(context).textTheme.bodySmall,
                decoration: InputDecoration(
                  hintText: TTexts.firstName,
                  prefixIcon: const Icon(Icons.person),
                  hintStyle: Theme.of(context).textTheme.titleSmall,
                  fillColor: isDark ? TColors.darkCard : TColors.textFieldFillColor,
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSection),

            /// Sign up button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () => Get.to(const OtpScreen()), child: const Text(TTexts.signUp)),
            ),
          ],
        ),
      ),
    );
  }
}
