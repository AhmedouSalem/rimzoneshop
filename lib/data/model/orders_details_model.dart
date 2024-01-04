class OrdersDetailsModel {
  int? itemsId;
  String? itemsNameAr;
  String? itemsNameEn;
  String? itemsNameFr;
  String? itemsDescAr;
  String? itemsDescEn;
  String? itemsDescFr;
  String? itemsImage;
  int? itemsOrderItemsId;
  int? itemsOrderOrdersId;
  int? itemsOrderQuantity;
  double? itemsOrderPrice;
  int? addressId;
  String? addressName;
  String? addressCity;
  String? addressStreet;
  double? addressLat;
  double? addressLong;

  OrdersDetailsModel(
      {this.itemsId,
      this.itemsNameAr,
      this.itemsNameEn,
      this.itemsNameFr,
      this.itemsDescAr,
      this.itemsDescEn,
      this.itemsDescFr,
      this.itemsImage,
      this.itemsOrderItemsId,
      this.itemsOrderOrdersId,
      this.itemsOrderQuantity,
      this.itemsOrderPrice,
      this.addressId,
      this.addressName,
      this.addressCity,
      this.addressStreet,
      this.addressLat,
      this.addressLong});

  OrdersDetailsModel.fromJson(Map<String, dynamic> json) {
    itemsId = json['items_id'];
    itemsNameAr = json['items_name_ar'];
    itemsNameEn = json['items_name_en'];
    itemsNameFr = json['items_name_fr'];
    itemsDescAr = json['items_desc_ar'];
    itemsDescEn = json['items_desc_en'];
    itemsDescFr = json['items_desc_fr'];
    itemsImage = json['items_image'];
    itemsOrderItemsId = json['itemsorder_items_id'];
    itemsOrderOrdersId = json['itemsorder_orders_id'];
    itemsOrderQuantity = json['itemsorder_quantity'];
    itemsOrderPrice = json['itemsorder_price'].toDouble();
    addressId = json['address_id'];
    addressName = json['address_name'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressLat = json['address_lat'];
    addressLong = json['address_long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['items_id'] = itemsId;
    data['items_name_ar'] = itemsNameAr;
    data['items_name_en'] = itemsNameEn;
    data['items_name_fr'] = itemsNameFr;
    data['items_desc_ar'] = itemsDescAr;
    data['items_desc_en'] = itemsDescEn;
    data['items_desc_fr'] = itemsDescFr;
    data['items_image'] = itemsImage;
    data['itemsorder_items_id'] = itemsOrderItemsId;
    data['itemsorder_orders_id'] = itemsOrderOrdersId;
    data['itemsorder_quantity'] = itemsOrderQuantity;
    data['itemsorder_price'] = itemsOrderPrice;
    data['address_id'] = addressId;
    data['address_name'] = addressName;
    data['address_city'] = addressCity;
    data['address_street'] = addressStreet;
    data['address_lat'] = addressLat;
    data['address_long'] = addressLong;
    return data;
  }
}
