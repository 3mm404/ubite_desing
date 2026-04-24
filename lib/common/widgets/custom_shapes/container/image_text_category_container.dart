
import 'package:flutter/material.dart';
import 'package:foodu/utils/constants/colors.dart';
import 'package:foodu/utils/constants/sizes.dart';
import 'package:foodu/utils/helpers/helper_function.dart';

class TImageTextCategoryContainer extends StatelessWidget {
  const TImageTextCategoryContainer({
    super.key, required this.image, required this.text, required this.onTap,
  });

  final String image;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(image: AssetImage(image),width: 40,height: 40,),
          const SizedBox(height: TSizes.sm,),
          Text(
            THelperFunctions.truncateText(text, 6),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelMedium!.apply(color: isDark ? TColors.textWhite :  TColors.textblack),
          ),
        ],
      ),
    );
  }
}