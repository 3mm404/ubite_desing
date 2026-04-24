import 'package:flutter/material.dart';
import 'package:foodu/common/widgets/login_signup/phone_number_field.dart';
import 'package:get/get.dart';

import '../../../../../utils/exports.dart';
import '../../otp/otp_screen.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Reactive boolean for "Remember me"
    final rememberMe = true.obs;
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSection),
        child: Column(
          children: [
            /// OTP Field
            const TPhoneNumberField(),
            const SizedBox(height: TSizes.sm),

            /// Remember Me + Forgot Password Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Remember Me Checkbox + Label
                Obx(() {
                  return Row(
                    children: [
                      Checkbox(
                        value: rememberMe.value,
                        onChanged: (val) {
                          // Toggle the reactive boolean
                          rememberMe.value = val ?? false;
                        },
                      ),
                      Text(
                        TTexts.rememberMe,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  );
                }),

                /// Forgot Password Button
                TextButton(
                  onPressed: () {
                    // TODO: Navigate to “Forgot Password” screen or show a dialog
                  },
                  child: Text(
                    TTexts.forgotPassword,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(decoration: TextDecoration.underline, color: TColors.primary),
                  ),
                ),
              ],
            ),
            const SizedBox(height: TSizes.sm),

            /// Sign in Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () => Get.to(const OtpScreen()), child: const Text(TTexts.signIN)),
            ),
          ],
        ),
      ),
    );
  }
}
