import 'package:flutter/cupertino.dart';
import 'package:foodu/common/styles/spacing_styles.dart';
import 'package:foodu/features/order/controller/order_controller.dart';
import 'package:foodu/features/order/screens/order_tab/widget/completd_order_card.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class CompletedOrderTab extends StatelessWidget {
  const CompletedOrderTab({super.key});

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
            return CompletedOrderCard(
              restaurantName: order['restaurantName'],
              itemsInfo: order['itemsInfo'],
              price: order['price'],
              isCompleted: order['isCompleted'],
              imageUrl: order['imageUrl'],
              onLeaveReview: () => controller.leaveReview(index),
              onOrderAgain: () => controller.orderAgain(index),
            );
          },
        ),
      ),
    );
  }
}
