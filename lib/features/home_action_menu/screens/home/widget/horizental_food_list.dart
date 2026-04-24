import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodu/common/widgets/custom_shapes/container/food_card_vertical.dart';
import 'package:foodu/features/home_action_menu/controller/home_controller.dart';
import 'package:foodu/utils/constants/sizes.dart';
import 'package:get/get.dart';

import '../../../../restaurant_details_and_food_place_order/screen/restaurent_detail/restaurent_detail_screen.dart';

class HorizontalFoodList extends StatelessWidget {
  const HorizontalFoodList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = HomeController.instance;
    return SizedBox(
      height: 325,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: controller.foodItems.length,
        itemBuilder: (context, index) {
          final item = controller.foodItems[index];
          return Padding(
            padding: const EdgeInsets.all(TSizes.sm),
            child: TFoodCardVertical(
              imageUrl: item['imageUrl'],
              title: item['title'],
              distance: item['distance'],
              rating: item['rating'],
              reviewsCount: item['reviewsCount'],
              price: item['price'],
              deliveryFee: item['deliveryFee'],
              isFavorite: item['isFavorite'],
              onFavoriteToggle: () {},
              onTap: () => Get.to(const RestaurantDetailScreen()),
            ),
          );
        },
      ),
    );
  }
}
