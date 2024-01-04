class CartModel {
  dynamic itemsQuantityPrice;
  int? countItemsQuantity;
  int? cartUsers;
  int? cartItems;
  int? itemsId;
  String? itemsNameAr;
  String? itemsNameEn;
  String? itemsNameFr;
  String? itemsDescAr;
  String? itemsDescEn;
  String? itemsDescFr;
  String? itemsImage;
  int? itemsCount;
  int? itemsActive;
  dynamic itemsPrice;
  int? itemsDiscount;
  String? itemsDatetime;
  int? itemsCategories;

  CartModel(
      {this.itemsQuantityPrice,
      this.countItemsQuantity,
      this.cartUsers,
      this.cartItems,
      this.itemsId,
      this.itemsNameAr,
      this.itemsNameEn,
      this.itemsNameFr,
      this.itemsDescAr,
      this.itemsDescEn,
      this.itemsDescFr,
      this.itemsImage,
      this.itemsCount,
      this.itemsActive,
      this.itemsPrice,
      this.itemsDiscount,
      this.itemsDatetime,
      this.itemsCategories});

  CartModel.fromJson(Map<String, dynamic> json) {
    itemsQuantityPrice = json['itemsQuantityPrice'];
    countItemsQuantity = json['countItemsQuantity'];
    cartUsers = json['cart_users'];
    cartItems = json['cart_items'];
    itemsId = json['items_id'];
    itemsNameAr = json['items_name_ar'];
    itemsNameEn = json['items_name_en'];
    itemsNameFr = json['items_name_fr'];
    itemsDescAr = json['items_desc_ar'];
    itemsDescEn = json['items_desc_en'];
    itemsDescFr = json['items_desc_fr'];
    itemsImage = json['items_image'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsDatetime = json['items_datetime'];
    itemsCategories = json['items_categories'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['itemsQuantityPrice'] = itemsQuantityPrice;
    data['countItemsQantity'] = countItemsQuantity;
    data['cart_users'] = cartUsers;
    data['cart_items'] = cartItems;
    data['items_id'] = itemsId;
    data['items_name_ar'] = itemsNameAr;
    data['items_name_en'] = itemsNameEn;
    data['items_name_fr'] = itemsNameFr;
    data['items_desc_ar'] = itemsDescAr;
    data['items_desc_en'] = itemsDescEn;
    data['items_desc_fr'] = itemsDescFr;
    data['items_image'] = itemsImage;
    data['items_count'] = itemsCount;
    data['items_active'] = itemsActive;
    data['items_price'] = itemsPrice;
    data['items_discount'] = itemsDiscount;
    data['items_datetime'] = itemsDatetime;
    data['items_categories'] = itemsCategories;
    return data;
  }
}
