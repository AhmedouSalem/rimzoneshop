import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rimzone_shop/controller/orders/product_order_details_controller.dart';
import 'package:rimzone_shop/core/functions/translatedatabase.dart';

class OrdersProductDetails extends StatelessWidget {
  const OrdersProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ProductOrderDetailsControllerImplement controllerDetails =
        Get.put(ProductOrderDetailsControllerImplement());
    return Scaffold(
      appBar: AppBar(title: const Text("Product Details")),
      bottomSheet: Container(
        child: ListView(
          children: [
            Text(
              "${translateDatabase(
                controllerDetails.ordersDetailsModelReceive.itemsNameAr,
                controllerDetails.ordersDetailsModelReceive.itemsNameEn,
                controllerDetails.ordersDetailsModelReceive.itemsNameFr,
              )}",
            ),
          ],
        ),
      ),
    );
  }
}
