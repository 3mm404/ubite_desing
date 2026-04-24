import 'package:flutter/material.dart';
import 'package:foodu/utils/constants/colors.dart';
import 'package:foodu/utils/constants/image_strings.dart';
import 'package:foodu/utils/constants/sizes.dart';
import 'package:foodu/utils/helpers/helper_function.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../controller/order_controller.dart';
import '../../../model/order_item_model.dart';

class OrderSummaryCard extends StatelessWidget {
  OrderSummaryCard({super.key, required this.title});

  final String title;
  final RestaurantOrderController orderController = Get.put(RestaurantOrderController());

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.all(TSizes.md),
      margin: const EdgeInsets.symmetric(vertical: TSizes.xm),
      decoration: BoxDecoration(
        color: isDark ? TColors.darkCard : Colors.white,
        borderRadius: BorderRadius.circular(TSizes.xm),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 10, offset: const Offset(0, 5))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title and Add Items Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: Theme.of(context).textTheme.bodyLarge),
              TextButton(
                onPressed: () {
                  orderController.addItem(
                    OrderItem(name: 'Mixid Salad', imageUrl: TImages.mixedSalad, price: 10.0, quantity: 1),
                  );
                },
                child: Text('Add Items', style: Theme.of(context).textTheme.labelLarge),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          // Order Items List
          Obx(() {
            return Column(
              children: orderController.orderItems.asMap().entries.map((entry) => _buildOrderItem(entry.key, entry.value, context)).toList(),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildOrderItem(int index, OrderItem item, BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        // Item Image
        ClipRRect(
          borderRadius: BorderRadius.circular(TSizes.sm),
          child: Image.asset(
            item.imageUrl,
            height: 70.0,
            width: 70.0,
            fit: BoxFit.cover,
          ),
        ),
        const Gap(16),
        // Item Details
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.name,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: isDark ? TColors.textWhite : Colors.black87),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                '\$${item.price.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 14.0, color: Colors.green, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        // Quantity and Edit Icon
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                decoration: BoxDecoration(
                  border: Border.all(color: TColors.primary),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text('${item.quantity}x', style: Theme.of(Get.context!).textTheme.labelLarge),
              ),
              IconButton(
                icon: const Icon(Icons.add, color: TColors.primary, size: 20),
                onPressed: () {
                  orderController.editItem(
                    index,
                    OrderItem(name: item.name, imageUrl: item.imageUrl, price: item.price, quantity: item.quantity + 1),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
