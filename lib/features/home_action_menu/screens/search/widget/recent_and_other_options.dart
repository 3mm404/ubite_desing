import 'package:flutter/cupertino.dart';
import 'package:foodu/features/home_action_menu/controller/search_controller.dart';
import 'package:foodu/features/home_action_menu/screens/search/widget/chip_list.dart';
import 'package:foodu/features/home_action_menu/screens/search/widget/section_title.dart';
import 'package:foodu/utils/constants/sizes.dart';
import 'package:gap/gap.dart';

class ShowRecentSearchAndOtherOptions extends StatelessWidget {
  const ShowRecentSearchAndOtherOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SearchPageController.instance;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Gap(TSizes.sm),
        const BuildSectionTitle(
          title: 'Recent Searches',
        ),
        const Gap(TSizes.sm),
        buildChipList(controller.recentSearches),
        const Gap(TSizes.md),
        const BuildSectionTitle(
          title: 'Popular Cuisines',
        ),
        const Gap(TSizes.sm),
        buildChipList(controller.popularCuisines),
        const Gap(TSizes.md),
        const BuildSectionTitle(
          title: 'All Cuisines',
        ),
        const Gap(TSizes.sm),
        buildChipList(controller.allCuisines),
      ],
    );
  }
}
