import 'package:flutter/material.dart';
import 'package:foodu/features/home_action_menu/model/search_food_item_model.dart';
import 'package:foodu/utils/constants/colors.dart';
import 'package:foodu/utils/constants/sizes.dart';
import 'package:foodu/utils/helpers/helper_function.dart';

class SearchFoodCard extends StatelessWidget {
  final SearchFoodItemModel foodItem;

  const SearchFoodCard({super.key, required this.foodItem});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(TSizes.sm),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    foodItem.imageUrl,
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: TSizes.xm),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              foodItem.title,
                              style: Theme.of(context).textTheme.bodySmall,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: TSizes.xs),
                      Text(
                        '${foodItem.distance} km | ⭐ ${foodItem.rating} (${foodItem.reviews})',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      const SizedBox(height: TSizes.xs),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${foodItem.price.toStringAsFixed(2)}',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          const Icon(Icons.favorite_border, color: Colors.redAccent),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: TSizes.sm),
            Divider(color: TColors.textGrey.withValues(alpha: 0.3)),
            const SizedBox(height: TSizes.sm),
            Column(
              children: foodItem.recommendedItems.map((item) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: TSizes.xs),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          item.imageUrl,
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: TSizes.xm),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            THelperFunctions.truncateText(item.title, 25),
                            style: Theme.of(context).textTheme.labelLarge!.apply(color: isDark ? TColors.textWhite : TColors.textblack),
                          ),
                          Text('\$${item.price.toStringAsFixed(2)}', style: Theme.of(context).textTheme.labelLarge),
                        ],
                      )
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
