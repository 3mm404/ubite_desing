import 'package:flutter/foundation.dart';
import 'package:foodu/features/order/screens/cancel_order/cancel_order_screen.dart';
import 'package:foodu/features/order/screens/track_order/track_order_screen.dart';
import 'package:foodu/features/order/screens/whats_your_mind/whats_your_mind.dart';
import 'package:foodu/utils/constants/image_strings.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  var tabs = ['Active', 'Completed', 'Cancelled'].obs;

  var orders = <Map<String, dynamic>>[
    {
      'restaurantName': 'Bite Me Sandwiches',
      'itemsInfo': '3 items | 1.4 km',
      'price': 32.00,
      'isCancelled': true,
      'imageUrl': TImages.mixedSalad,
    },
  ].obs;

  var completedOrders = <Map<String, dynamic>>[
    {
      'restaurantName': 'Zero Zero Noodles',
      'itemsInfo': '4 items | 2.7 km',
      'price': 22.00,
      'isCompleted': true,
      'imageUrl': TImages.mixedSalad,
    },
  ].obs;

  void leaveReview(int index) {
    Get.to(const WhatsYourMind());
  }

  void orderAgain(int index) {
    if (kDebugMode) print('Ordering again for order at index: $index');

  }

  var activeOrders = <Map<String, dynamic>>[
    {
      'restaurantName': 'Zero Zero Noodles',
      'itemsInfo': '4 items | 2.7 km',
      'price': 22.00,
      'isPaid': true,
      'imageUrl': TImages.mixedSalad,
    },
  ].obs;

  void cancelOrder(int index) {
    Get.to(const CancelOrderScreen());
  }

  void trackOrder(int index) {
    Get.to(const TrackOrderScreen());
  }

  var reasons = [
    "Waiting for long time",
    "Unable to contact driver",
    "Driver denied to go to destination",
    "Driver denied to come to pickup",
    "Wrong address shown",
    "The price is not reasonable",
    "I want to order another restaurant",
    "I just want to cancel",
    "Others"
  ].obs;

  var selectedReason = ''.obs;

  void selectReason(String reason) {
    selectedReason.value = reason;
  }

  final List<String> myEmojis = ["😊", "😍", "😎", "🤩", "😂", "🤔", "😐", "😕", "😞", "😡", "👍", "👎", "🙌", "🎉", "💡", "🙏"];

  var emojiBorderStates = <bool>[].obs;

  void initializeEmojiList(List<String> emojis) {
    emojiBorderStates.value = List<bool>.filled(emojis.length, false);
  }

  void toggleBorder(int index) {
    emojiBorderStates[index] = !emojiBorderStates[index];
  }

  final List<int> tips = [1, 2, 4, 6, 8, 10, 12, 14];

  var selectedTip = 0.obs;

  void updateSelectedTip(int tip) {
    selectedTip.value = tip;
  }
}
