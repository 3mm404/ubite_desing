import 'package:flutter/material.dart';
import 'package:foodu/common/widgets/button/profile_toggle_item.dart';
import 'package:foodu/utils/constants/image_strings.dart';
import 'package:foodu/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../restaurant_details_and_food_place_order/screen/discount/discount_screen.dart';
import '../../../restaurant_details_and_food_place_order/screen/payment_method/payment_method_screen.dart';
import '../../controller/profile_controller.dart';
import '../address/address_screen.dart';
import '../favourite/favourite_screen.dart';
import '../help_center/help_center_screen.dart';
import '../invite_friend/invite_friend_screen.dart';
import '../language/language_setting.dart';
import '../notification/notification_setting.dart';
import '../security/security_setting.dart';
import '../update_profile/update_profile_screen.dart';
import 'widget/log_out_button.dart';
import 'widget/profile_header.dart';
import 'widget/profile_list_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: TSizes.defaultSpace),
          child: Image.asset(TImages.appLogo),
        ),
        title: Text("Profile", style: Theme.of(context).textTheme.titleLarge),
        // actions: const [
        //   Padding(
        //     padding: EdgeInsets.only(right: TSizes.defaultSpace),
        //     child: ImageIcon(AssetImage(TImages.more)),
        //   )
        // ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            // spacing: TSizes.sm,
            children: [
              ProfileHeader(
                name: 'Andrew Ainsley',
                phoneNumber: '+1 111 467 378 399',
                imageUrl: TImages.pic,
                onEdit: () => Get.to(const UpdateProfileScreen()),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              const Divider(),
              ProfileListItem(
                icon: Iconsax.heart,
                title: 'My Favorite Restaurants',
                onTap: () => Get.to(const FavouriteScreen()),
              ),
              ProfileListItem(
                icon: Iconsax.tag,
                title: 'Special Offers & Promo',
                onTap: () {
                  Get.to(DiscountScreen());
                },
              ),
              ProfileListItem(
                icon: Icons.payment,
                title: 'Payment Methods',
                onTap: () => Get.to(const PaymentMethodScreen()),
              ),
              const Divider(),
              ProfileListItem(
                icon: Iconsax.user,
                title: 'Profile',
                onTap: () => Get.to(const UpdateProfileScreen()),
              ),
              ProfileListItem(
                icon: Iconsax.location,
                title: 'Address',
                onTap: () => Get.to(const AddressScreen()),
              ),
              ProfileListItem(
                icon: Iconsax.notification,
                title: 'Notification',
                onTap: () => Get.to(const NotificationSetting()),
              ),
              ProfileListItem(
                icon: Iconsax.shield,
                title: 'Security',
                onTap: () => Get.to(const SecuritySetting()),
              ),
              ProfileListItem(
                icon: Iconsax.global,
                title: 'Language',
                trailingText: 'English (US)',
                onTap: () => Get.to(const LanguageSetting()),
              ),
              Obx(
                () => ProfileToggleItem(
                  icon: Iconsax.moon,
                  title: 'Dark Mode',
                  value: controller.isDarkMode.value,
                  onChanged: (newValue) {
                    controller.toggleDarkMode(newValue);
                  },
                ),
              ),
              ProfileListItem(
                icon: Iconsax.message_question,
                title: 'Help Center',
                onTap: () => Get.to(const HelpCenterScreen()),
              ),
              ProfileListItem(
                icon: Iconsax.people,
                title: 'Invite Friends',
                onTap: () => Get.to(const InviteFriendsScreen()),
              ),
              const Divider(),
              LogoutButton(onTap: () => showLogoutConfirmation(context)),
            ],
          ),
        ),
      ),
    );
  }

  void showLogoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to log out?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
                // Add your logout functionality here
              },
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }
}
