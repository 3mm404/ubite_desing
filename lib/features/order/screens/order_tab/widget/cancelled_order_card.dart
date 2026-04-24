import 'package:flutter/material.dart';
import 'package:foodu/utils/constants/colors.dart';
import 'package:foodu/utils/constants/sizes.dart';
import 'package:foodu/utils/helpers/helper_function.dart';

class CancelledOrderCard extends StatelessWidget {
  final String restaurantName;
  final String itemsInfo;
  final double price;
  final bool isCancelled;
  final String imageUrl;

  const CancelledOrderCard({
    super.key,
    required this.restaurantName,
    required this.itemsInfo,
    required this.price,
    required this.isCancelled,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: TSizes.sm),
      padding: const EdgeInsets.all(TSizes.md),
      decoration: BoxDecoration(
        color: isDark ? TColors.darkCard : Colors.white,
        borderRadius: BorderRadius.circular(TSizes.xm),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6.0, offset: Offset(0, 2)),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(TSizes.xm),
            child: Image.asset(imageUrl, width: 80, height: 80, fit: BoxFit.cover),
          ),
          const SizedBox(width: TSizes.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(restaurantName, style: Theme.of(context).textTheme.bodyLarge),
                const SizedBox(height: TSizes.xs),
                Text(itemsInfo, style: Theme.of(context).textTheme.labelSmall),
                const SizedBox(height: TSizes.sm),
                Row(
                  children: [
                    Text('\$$price', style: Theme.of(context).textTheme.bodyLarge!.apply(color: TColors.primary)),
                    const SizedBox(width: TSizes.sm),
                    if (isCancelled)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: TSizes.md, vertical: TSizes.xs),
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.red), borderRadius: BorderRadius.circular(TSizes.buttonRadius)),
                        child: Text('Cancelled', style: Theme.of(context).textTheme.bodySmall!.apply(color: Colors.red)),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
