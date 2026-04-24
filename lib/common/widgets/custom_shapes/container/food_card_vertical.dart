import 'package:flutter/material.dart';
import 'package:foodu/utils/constants/colors.dart';
import 'package:foodu/utils/constants/sizes.dart';
import 'package:foodu/utils/helpers/helper_function.dart';
import 'package:iconsax/iconsax.dart';

class TFoodCardVertical extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String distance;
  final String rating;
  final String reviewsCount;
  final String price;
  final String deliveryFee;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;
  final VoidCallback onTap;

  const TFoodCardVertical({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.distance,
    required this.rating,
    required this.reviewsCount,
    required this.price,
    required this.deliveryFee,
    required this.isFavorite,
    required this.onFavoriteToggle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 210,
        padding: const EdgeInsets.all(TSizes.sm + 2),
        decoration: BoxDecoration(
          color: isDark ? TColors.darkCard : Colors.white,
          borderRadius: BorderRadius.circular(TSizes.cardRadiusMd),
          boxShadow: [
            // Shadow of the Card
            BoxShadow(color: Colors.black.withValues(alpha: 0.1), spreadRadius: 0.3, blurRadius: 6, offset: const Offset(0, 1)),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                /// Image of the product
                ClipRRect(
                  borderRadius: BorderRadius.circular(TSizes.cardRadiusMd),
                  child: Image.asset(imageUrl, fit: BoxFit.contain, width: double.infinity),
                ),

                /// Promo Text
                Positioned(
                  top: TSizes.md,
                  left: TSizes.sm,
                  child: Container(
                    width: 55,
                    height: 25,
                    padding: const EdgeInsets.all(TSizes.xs),
                    decoration: BoxDecoration(color: TColors.primary, borderRadius: BorderRadius.circular(8)),
                    child: Text(
                      'PROMO',
                      style: Theme.of(context).textTheme.labelSmall!.apply(color: TColors.backgroundLight),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: TSizes.sm),

            /// Title of the product
            Text(title, style: Theme.of(context).textTheme.bodyLarge, maxLines: 1, overflow: TextOverflow.ellipsis),
            const SizedBox(height: TSizes.sm),

            /// Distance and Ratings/Reviews
            Row(
              children: [
                // Distance
                Text(distance, style: Theme.of(context).textTheme.labelSmall),
                const SizedBox(width: TSizes.xs),

                // Divider
                const SizedBox(height: 14, child: VerticalDivider(thickness: 1, color: TColors.textGrey)),

                // Rating Icon
                const Icon(Icons.star, size: 12, color: TColors.rating),
                const SizedBox(width: TSizes.xs),

                // Rating
                Text(rating, style: Theme.of(context).textTheme.labelSmall),

                // Reviews Count
                Text(' ($reviewsCount)', style: Theme.of(context).textTheme.labelSmall),
              ],
            ),
            const SizedBox(height: TSizes.sm),

            /// Product price and Delivery Fee
            Row(
              children: [
                // Product Price
                Text("\$$price", style: Theme.of(context).textTheme.bodyLarge!.apply(color: TColors.primary)),
                const SizedBox(height: 14, child: VerticalDivider(thickness: 1, color: TColors.textGrey)),
                const Icon(Icons.delivery_dining, size: 20, color: TColors.primary),
                const SizedBox(width: TSizes.xs),

                // Delivery Fee
                Text("\$$deliveryFee", style: Theme.of(context).textTheme.labelSmall),

                // Space between fav Icon and the delivery fee
                const Spacer(),

                /// Favorite Icon
                GestureDetector(
                  onTap: onFavoriteToggle,
                  child: Icon(isFavorite ? Iconsax.heart5 : Iconsax.heart, color: Colors.red, size: 20),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
