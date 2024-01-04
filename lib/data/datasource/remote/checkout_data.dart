import 'package:dartz/dartz.dart';
import 'package:rimzone_shop/core/class/crud.dart';
import 'package:rimzone_shop/core/class/statusrequest.dart';
import 'package:rimzone_shop/core/constant/apilinks.dart';

class CheckoutData {
  Crud crud;
  CheckoutData(
    this.crud,
  );

  sendOrder(
      String usersID,
      String usersAddress,
      String couponID,
      String subtotal,
      String priceDelivery,
      String paymentMethod,
      List<Map<String, dynamic>> itemsOrder) async {
    Either<StatusRequest, Map<String, dynamic>> response =
        await crud.postDataJson(
      AppApiLinks.checkout,
      {
        "itemsOrder": itemsOrder,
        "orders_users": usersID,
        "orders_address": usersAddress,
        "coupon_id": couponID,
        "orders_subtotal": subtotal,
        "orders_price_delivery": priceDelivery,
        "orders_payment_method": paymentMethod,
      },
    );
    return response.fold((l) => l, (r) => r);
  }

  getOrders(String usersID) async {
    Either<StatusRequest, Map<String, dynamic>> response = await crud.postData(
      AppApiLinks.orders,
      {
        "users_id": usersID,
      },
    );
    return response.fold((l) => l, (r) => r);
  }

  deleteOrders(String ordersID) async {
    Either<StatusRequest, Map<String, dynamic>> response = await crud.postData(
      AppApiLinks.deleteOrder,
      {
        "orders_id": ordersID,
      },
    );
    return response.fold((l) => l, (r) => r);
  }

  getOrdersDetails(String ordersID) async {
    Either<StatusRequest, Map<String, dynamic>> response = await crud.postData(
      AppApiLinks.ordersDetails,
      {
        "orders_id": ordersID,
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
