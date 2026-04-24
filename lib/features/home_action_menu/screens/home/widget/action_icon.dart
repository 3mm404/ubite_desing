import 'package:flutter/material.dart';
import 'package:foodu/utils/constants/colors.dart';

class ActionIcon extends StatelessWidget {
  const ActionIcon({
    super.key,
    required this.iconData,
    required this.onTap,
  });

  final IconData iconData;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: TColors.borderGrey),
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      child: Stack(
        children: [
          IconButton(onPressed: onTap, icon: Icon(iconData)),
          Positioned(
            right: 12,
            top: 12,
            child: Container(
              width: 7,
              height: 7,
              decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(100)),
            ),
          )
        ],
      ),
    );
  }
}
