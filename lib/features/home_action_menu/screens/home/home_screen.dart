import 'package:flutter/material.dart';
import 'package:foodu/common/widgets/app_bar/app_bar.dart';
import 'package:foodu/common/widgets/button/title_with_text_button.dart';
import 'package:foodu/common/widgets/custom_shapes/container/discount_container.dart';
import 'package:foodu/common/widgets/custom_shapes/container/search_container.dart';
import 'package:foodu/features/home_action_menu/controller/home_controller.dart';
import 'package:foodu/features/home_action_menu/screens/cart/cart_screen.dart';
import 'package:foodu/features/home_action_menu/screens/home/widget/action_icon.dart';
import 'package:foodu/features/home_action_menu/screens/home/widget/category_grid_view.dart';
import 'package:foodu/features/home_action_menu/screens/home/widget/chip_list_row.dart';
import 'package:foodu/features/home_action_menu/screens/home/widget/horizental_food_list.dart';
import 'package:foodu/features/home_action_menu/screens/home/widget/verical_food_list.dart';
import 'package:foodu/features/home_action_menu/screens/notification/notification_screen.dart';
import 'package:foodu/features/home_action_menu/screens/recommanded_for_you/recommanded_for_you_screen.dart';
import 'package:foodu/features/home_action_menu/screens/search/search_screen.dart';
import 'package:foodu/utils/constants/colors.dart';
import 'package:foodu/utils/constants/image_strings.dart';
import 'package:foodu/utils/constants/sizes.dart';
import 'package:foodu/utils/helpers/helper_function.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../restaurant_details_and_food_place_order/screen/discount/discount_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    Get.put(HomeController());
    return SafeArea(
      child: Scaffold(
        appBar: TAppBar(
          // User Image
          leadingImage: TImages.pic,
          increaseAppbarSpace: TSizes.defaultSpace,
          height: TSizes.homeAppBarHeight,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Deliver To', style: Theme.of(context).textTheme.labelSmall),

              // User Address
              GestureDetector(
                onTap: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Text(
                        'Time Square',
                        style: Theme.of(context).textTheme.labelLarge!.apply(color: isDark ? TColors.textWhite : TColors.textblack),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

                    // Icon to select other locations
                    const Icon(Icons.arrow_drop_down, color: TColors.primary),
                  ],
                ),
              ),
            ],
          ),

          /// Notification and Cart Icons
          actions: [
            ActionIcon(onTap: () => Get.to(const NotificationScreen()), iconData: Iconsax.notification),
            const Gap(TSizes.sm),
            ActionIcon(onTap: () => Get.to(const CartScreen()), iconData: Iconsax.shopping_cart),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
            child: Column(
              children: [
                /// SearchBar Section
                GestureDetector(onTap: () => Get.to(const SearchScreen()), child: const TSearchContainer(text: 'What are you craving?')),
                const SizedBox(height: TSizes.spaceBtwSection),

                /// Banners Section
                TRowWithTextButton(title: 'Special Offer', onTap: () => Get.to(DiscountScreen())),
                const SizedBox(height: TSizes.spaceBtwItems),
                const DiscountImage(imagePath: TImages.banner4),
                const SizedBox(height: TSizes.spaceBtwSection),

                /// Categories Section
                const CategoryGridView(),
                const SizedBox(height: TSizes.spaceBtwSection),

                /// Discount Guaranteed Section
                TRowWithTextButton(title: 'Discount Guaranteed!', onTap: () => Get.to(DiscountScreen())),
                const SizedBox(height: TSizes.spaceBtwItems),
                const HorizontalFoodList(),
                const SizedBox(height: TSizes.spaceBtwSection),

                /// Recommended Section
                TRowWithTextButton(title: 'Recommended For You', onTap: () => Get.to(const RecommandedForYouScreen())),
                const ChipListRow(),
                const VerticalFoodList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
