class FavoriteModel {
  int? favoriteId;
  int? favoriteUsers;
  int? favoriteItems;
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
  double? itemsPrice;
  int? itemsDiscount;
  String? itemsDatetime;
  int? itemsCategories;
  int? usersId;
  double? itemsPriceDiscount;

  FavoriteModel({
    this.favoriteId,
    this.favoriteUsers,
    this.favoriteItems,
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
    this.itemsCategories,
    this.usersId,
    this.itemsPriceDiscount,
  });

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    favoriteId = json['favorite_id'];
    favoriteUsers = json['favorite_users'];
    favoriteItems = json['favorite_items'];
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
    itemsPrice = double.parse(json['items_price'].toStringAsFixed(2));
    itemsDiscount = json['items_discount'];
    itemsDatetime = json['items_datetime'];
    itemsCategories = json['items_categories'];
    usersId = json['users_id'];
    itemsPriceDiscount =
        double.parse(json['itemsPriceDiscount'].toStringAsFixed(2));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['favorite_id'] = favoriteId;
    data['favorite_users'] = favoriteUsers;
    data['favorite_items'] = favoriteItems;
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
    data['users_id'] = usersId;
    data['itemsPriceDiscount'] = itemsPriceDiscount;
    return data;
  }
}
