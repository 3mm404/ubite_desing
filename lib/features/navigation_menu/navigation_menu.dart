import 'package:flutter/material.dart';
import 'package:foodu/features/navigation_menu/controller.dart';
import 'package:foodu/utils/constants/colors.dart';
import 'package:foodu/utils/constants/image_strings.dart';
import 'package:foodu/utils/helpers/helper_function.dart';
import 'package:get/get.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final isDark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          elevation: 20,
          currentIndex: controller.selectedIndex.value,
          onTap: (index) => controller.selectedIndex.value = index,
          selectedItemColor: TColors.primary,
          unselectedItemColor: TColors.textGrey,
          showUnselectedLabels: true,
          backgroundColor: isDark ? const Color(0xD8181A20) : TColors.backgroundLight,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(TImages.home)),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(TImages.order)),
              label: 'Order',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(TImages.chat)),
              label: 'Messages',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(TImages.walletIcon)),
              label: 'E-wallet',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(TImages.profile)),
              label: 'Profile',
            ),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}
