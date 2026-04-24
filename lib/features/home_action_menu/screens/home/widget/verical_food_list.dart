import 'package:flutter/cupertino.dart';
import 'package:foodu/common/widgets/custom_shapes/container/food_card_horizental.dart';
import 'package:foodu/features/home_action_menu/controller/home_controller.dart';
import 'package:get/get.dart';

import '../../../../restaurant_details_and_food_place_order/screen/restaurent_detail/restaurent_detail_screen.dart';

class VerticalFoodList extends StatelessWidget {
  const VerticalFoodList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = HomeController.instance;
    return ListView.builder(
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: controller.foodItems.length,
        itemBuilder: (context, index) {
          final item = controller.foodItems[index];
          return TFoodCardHorizontal(
            imageUrl: item['imageUrl'],
            title: item['title'],
            distance: item['distance'],
            rating: item['rating'],
            reviewCount: item['reviewsCount'],
            price: item['price'],
            deliveryFee: item['deliveryFee'],
            isFavorite: item['isFavorite'],

            // Add logic to add or remove item from cart
            onFavoriteToggle: () {},
            onTap: () => Get.to(const RestaurantDetailScreen()),
          );
        });
  }
}
