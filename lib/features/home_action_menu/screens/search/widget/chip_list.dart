import 'package:flutter/cupertino.dart';
import 'package:foodu/common/widgets/custom_shapes/container/custom_chip.dart';
import 'package:foodu/utils/constants/sizes.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

Widget buildChipList(RxList<String> items) {
  return Wrap(
    runSpacing: TSizes.sm,
    spacing: TSizes.sm,
    children: items.map((item) => TCustomChip(label: item)).toList(),
  );
}
