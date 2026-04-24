import 'package:flutter/material.dart';
import 'package:foodu/common/styles/spacing_styles.dart';
import 'package:foodu/common/widgets/app_bar/app_bar.dart';
import 'package:get/get.dart';

import '../../../wallet/controller/wallet_controller.dart';
import '../finding_nearby_driver/finding_driver.dart';
import 'widget/delivery_address_card.dart';
import 'widget/order_summery_card.dart';
import 'widget/order_summery_detail.dart';
import 'widget/payment_and_discount.dart';

class CheckoutOrderScreen extends StatelessWidget {
  const CheckoutOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(WalletController());
    Get.put(WalletController());
    return Scaffold(
      appBar: const TAppBar(
        showBackButton: true,
        title: Text("Checkout Order"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyles.paddingWithHeightWidth,
          child: Column(
            children: [
              const DeliveryAddressCard(title: 'Home', address: 'Times Square NYC, Manhattan', isDefault: true),
              OrderSummaryCard(title: "Order Summery"),
              const PaymentsAndDiscounts(),
              const OrderSummaryDetail(subtotal: 24, deliveryFee: 2)
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(onPressed: () => Get.to(const FindingDriver()), child: const Text("Place Order - 26\$"))),
      ),
    );
  }
}
