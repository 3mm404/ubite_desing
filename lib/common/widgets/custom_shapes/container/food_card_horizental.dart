import 'package:flutter/material.dart';
import 'package:foodu/utils/constants/colors.dart';
import 'package:foodu/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class TFoodCardHorizontal extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String distance;
  final String rating;
  final String reviewCount;
  final String price;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;
  final String deliveryFee;
  final VoidCallback onTap;

  const TFoodCardHorizontal({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.distance,
    required this.rating,
    required this.reviewCount,
    required this.price,
    required this.isFavorite,
    required this.deliveryFee,
    required this.onFavoriteToggle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        // Border shadow
        elevation: 4,
        shadowColor: Colors.black.withValues(alpha: 0.3),
        child: Padding(
          padding: const EdgeInsets.all(TSizes.sm),
          child: Row(
            children: [
              /// Card Image
              ClipRRect(
                borderRadius: BorderRadius.circular(TSizes.cardRadiusMd),
                child: Image.asset(imageUrl, width: 90, height: 90, fit: BoxFit.cover),
              ),
              const SizedBox(width: TSizes.sm),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Card Title
                    Text(title, style: Theme.of(context).textTheme.bodyLarge, maxLines: 1, overflow: TextOverflow.ellipsis),
                    const SizedBox(height: TSizes.sm),

                    /// Distance and Ratings
                    Row(
                      children: [
                        Text(distance, style: Theme.of(context).textTheme.labelSmall),
                        const SizedBox(width: TSizes.sm),
                        const Icon(Icons.star, color: TColors.rating, size: 16.0),
                        const SizedBox(width: TSizes.sm),
                        Text('$rating (${reviewCount}k)', style: Theme.of(context).textTheme.labelSmall),
                      ],
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),

                    /// Price and Delivery fee
                    Row(
                      children: [
                        Text("\$$price", style: Theme.of(context).textTheme.bodyLarge!.apply(color: TColors.primary)),
                        const SizedBox(height: 14, child: VerticalDivider(thickness: 1, color: TColors.textGrey)),
                        const Icon(Icons.delivery_dining, color: Colors.green, size: 16.0),
                        const SizedBox(height: TSizes.sm),
                        Text('\$$deliveryFee', style: Theme.of(context).textTheme.labelSmall),
                      ],
                    ),
                  ],
                ),
              ),

              /// Favorites Icon
              IconButton(
                icon: Icon(isFavorite ? Iconsax.heart5 : Iconsax.heart, color: Colors.red),
                onPressed: onFavoriteToggle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
