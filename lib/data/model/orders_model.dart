class OrdersModel {
  int? ordersId;
  int? ordersUsers;
  int? ordersAddress;
  int? ordersDiscount;
  double? ordersSubtotal;
  double? ordersPriceDelivery;
  double? ordersPriceTotal;
  String? ordersDateTime;
  int? ordersPaymentMethod;
  int? ordersStatus;

  OrdersModel(
      {this.ordersId,
      this.ordersUsers,
      this.ordersAddress,
      this.ordersDiscount,
      this.ordersSubtotal,
      this.ordersPriceDelivery,
      this.ordersPriceTotal,
      this.ordersDateTime,
      this.ordersPaymentMethod,
      this.ordersStatus});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    ordersUsers = json['orders_users'];
    ordersAddress = json['orders_address'];
    ordersDiscount = json['orders_discount'];
    ordersSubtotal = double.parse(json['orders_subtotal'].toStringAsFixed(2));
    ordersPriceDelivery =
        double.parse(json['orders_price_delivery'].toStringAsFixed(2));
    ordersPriceTotal =
        double.parse(json['orders_price_total'].toStringAsFixed(2));
    ordersDateTime = json['orders_datetime'];
    ordersPaymentMethod = json['orders_payment_method'];
    ordersStatus = json['orders_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orders_id'] = ordersId;
    data['orders_users'] = ordersUsers;
    data['orders_address'] = ordersAddress;
    data['orders_discount'] = ordersDiscount;
    data['orders_subtotal'] = ordersSubtotal;
    data['orders_price_delivery'] = ordersPriceDelivery;
    data['orders_price_total'] = ordersPriceTotal;
    data['orders_datetime'] = ordersDateTime;
    data['orders_payment_method'] = ordersPaymentMethod;
    data['orders_status'] = ordersStatus;
    return data;
  }
}
