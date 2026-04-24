import 'package:flutter/material.dart';
import 'package:foodu/common/widgets/app_bar/app_bar.dart';
import 'package:foodu/utils/constants/sizes.dart';
import 'package:get/get.dart';

import '../../../personalization/screens/profile_form/widget/profile_form.dart';
import '../../controller/profile_controller.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    return Scaffold(
      appBar: const TAppBar(
        showBackButton: true,
        title: Text("Update Profile"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace, vertical: TSizes.defaultSpace),
          child: Column(
            children: [
              const ProfileForm(),
              const SizedBox(
                height: TSizes.defaultSpace,
              ),
              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {}, child: const Text('Update')))
            ],
          ),
        ),
      ),
    );
  }
}
