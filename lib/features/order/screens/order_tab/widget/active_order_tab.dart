import 'package:flutter/cupertino.dart';
import 'package:foodu/common/styles/spacing_styles.dart';
import 'package:foodu/features/order/controller/order_controller.dart';
import 'package:foodu/features/order/screens/order_tab/widget/active_order_card.dart';
import 'package:get/get.dart';

import '../../track_order/track_order_screen.dart';

class ActiveOrderTab extends StatelessWidget {
  const ActiveOrderTab({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OrderController.instance;
    return Padding(
      padding: TSpacingStyles.paddingWithHeightWidth,
      child: Obx(
        () => ListView.builder(
          itemCount: controller.completedOrders.length,
          itemBuilder: (context, index) {
            var order = controller.completedOrders[index];
            return ActiveOrderCard(
              restaurantName: order['restaurantName'],
              itemsInfo: order['itemsInfo'],
              price: order['price'],
              isCompleted: order['isCompleted'],
              imageUrl: order['imageUrl'],
              onCancelOrder: () => controller.cancelOrder(index),
              onTrackOrder: () => Get.to(const TrackOrderScreen()),
            );
          },
        ),
      ),
    );
  }
}
