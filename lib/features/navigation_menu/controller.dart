import 'package:foodu/features/chats/screens/chat_screen/chat_screen.dart';
import 'package:foodu/features/home_action_menu/screens/home/home_screen.dart';
import 'package:foodu/features/order/screens/order_tab/order_screen.dart';
import 'package:foodu/features/profile/screens/profile_screen/profile_screen.dart';
import 'package:foodu/features/wallet/screens/e_wallet/e_wallet_screen.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const OrderScreen(),
    const ChatScreen(),
    const EWalletScreen(),
    const ProfileScreen(),
  ];
}
