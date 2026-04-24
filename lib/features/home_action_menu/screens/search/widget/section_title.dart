import 'package:flutter/cupertino.dart';
import 'package:foodu/utils/constants/colors.dart';
import 'package:foodu/utils/helpers/helper_function.dart';

class BuildSectionTitle extends StatelessWidget {
  const BuildSectionTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Text(
      title,
      style: TextStyle(
          fontSize: 16.0, fontFamily: 'Urbanist', fontWeight: FontWeight.bold, color: isDark ? TColors.textWhite : TColors.textblack),
    );
  }
}
