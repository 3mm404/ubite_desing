import 'package:flutter/material.dart';
import 'package:foodu/common/widgets/custom_shapes/container/custom_chip.dart';
import 'package:foodu/features/home_action_menu/controller/home_controller.dart';
import 'package:foodu/utils/constants/colors.dart';
import 'package:foodu/utils/constants/sizes.dart';
import 'package:get/get.dart';

class ChipListRow extends StatelessWidget {
  const ChipListRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final isDark = THelperFunctions.isDarkMode(context);
    final controller = HomeController.instance;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwItems),
      child: SizedBox(
        height: 35,
        width: double.infinity,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: controller.chipListName.length,
          itemBuilder: (context, index) {
            return Obx(() {
              bool isSelected = index == controller.selectedChipIndex.value;
              return TCustomChip(
                label: controller.chipListName[index],
                labelColor: isSelected ? Colors.white : TColors.primary,
                imagePath: controller.chipListImage[index],
                onTap: () => controller.selectChip(index),
                backgroundColor: isSelected ? TColors.primary : Colors.white,
              );
            });
          },
          separatorBuilder: (BuildContext context, int index) => const SizedBox(width: TSizes.sm),
        ),
      ),
    );
  }
}
