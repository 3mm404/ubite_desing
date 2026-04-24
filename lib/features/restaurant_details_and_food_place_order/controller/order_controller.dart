import 'package:get/get.dart';

import '../../../utils/constants/image_strings.dart';
import '../model/order_item_model.dart';

class RestaurantOrderController extends GetxController {
  var orderItems = <OrderItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    orderItems.add(OrderItem(name: 'Mixid Salad', imageUrl: TImages.mixedSalad, price: 10.0, quantity: 1),);
  }

  void addItem(OrderItem item) {
    orderItems.add(item);
  }

  void editItem(int index, OrderItem updatedItem) {
    orderItems[index] = updatedItem;
  }

  void removeItem(int index) {
    orderItems.removeAt(index);
  }
}
