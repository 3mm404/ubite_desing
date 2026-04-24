import 'package:get/get.dart';

import '../data/services/network_service/network_manager.dart';
import '../features/personalization/controller/pin_controller.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    /// -- Core
    Get.put(NetworkManager());
    Get.put(PinController());
  }
}
