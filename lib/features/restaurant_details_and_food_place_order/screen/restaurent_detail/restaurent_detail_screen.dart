import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodu/utils/constants/colors.dart';
import 'package:foodu/utils/constants/image_strings.dart';
import 'package:foodu/utils/constants/sizes.dart';
import 'package:foodu/utils/helpers/helper_function.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../home_action_menu/screens/home/widget/horizental_food_list.dart';
import '../../../home_action_menu/screens/home/widget/verical_food_list.dart';
import '../../controller/restaurant_controller.dart';
import '../add_item_to_basket/add_item_to_basket.dart';
import '../checkout_order/checkout_order_screen.dart';
import '../restaurent_about/restaurent_about_screen.dart';
import '../restaurent_offer/offer_screen.dart';
import '../restaurent_rating_and_reviews/rating_and_reviews.dart';
import 'widget/info_row.dart';

class RestaurantDetailScreen extends StatelessWidget {
  const RestaurantDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RestaurantController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                /// Background Image
                Container(
                  width: double.infinity,
                  height: THelperFunctions.screenHeight(context: context) / 2,
                  decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage(TImages.restaurent), fit: BoxFit.cover),
                  ),
                ),

                /// Appbar with Icons
                Positioned(
                  top: TSizes.appBarHeight + 8,
                  right: 0,
                  left: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(onPressed: () => Get.back(), icon: const Icon(Iconsax.arrow_left, color: Colors.white)),
                        SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(onPressed: () {}, icon: const Icon(Iconsax.heart, color: Colors.white)),
                              IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.paperplane, color: Colors.white)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),

            /// Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  /// Heading
                  InfoRow(
                    title: 'Big Gardan Salad',
                    onTap: () => Get.to(const RestaurantAboutScreen()),
                  ),
                  InfoRow(
                    text: '4.8',
                    secondaryText: '(4.8k reviews)',
                    onTap: () => Get.to(const RatingAndReviews()),
                    leadingIcon: const Icon(CupertinoIcons.star_fill, color: TColors.rating),
                  ),
                  InfoRow(
                    text: '2.4 Km',
                    priceText: '\$2.0',
                    showBottomRow: true,
                    onTap: () => Get.to(const AddItemToBasket()),
                    leadingIcon: const Icon(Iconsax.location5, color: TColors.primary),
                  ),
                  InfoRow(
                      text: 'Offers are available',
                      leadingIcon: const Icon(Iconsax.tag5, color: TColors.primary),
                      onTap: () => Get.to(const OfferScreen())),
                ],
              ),
            ),

            /// FOR YOU LIST
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
              child: Text("For You", style: Theme.of(context).textTheme.bodyLarge),
            ),
            const HorizontalFoodList(),
            const Gap(TSizes.spaceBtwSection),

            /// MENU LIST
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
              child: Text("Menu", style: Theme.of(context).textTheme.bodyLarge),
            ),
            const VerticalFoodList(),
            const Gap(TSizes.spaceBtwSection),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace, vertical: TSizes.defaultSpace),
        child: ElevatedButton(onPressed: () => Get.to(const CheckoutOrderScreen()), child: const Text('Basket - 1 item -\$2 ')),
      ),
    );
  }
}
