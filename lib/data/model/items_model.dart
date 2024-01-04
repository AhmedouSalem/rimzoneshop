class ItemsModel {
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
  int? categoriesId;
  String? categoriesNameAr;
  String? categoriesNameEn;
  String? categoriesNameFr;
  String? categoriesDatetime;
  int? favorite;
  double? itemsPriceDiscount;

  ItemsModel({
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
    this.categoriesId,
    this.categoriesNameAr,
    this.categoriesNameEn,
    this.categoriesNameFr,
    this.categoriesDatetime,
    this.favorite,
    this.itemsPriceDiscount,
  });

  ItemsModel.fromJson(Map<String, dynamic> json) {
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
    categoriesId = json['categories_id'];
    categoriesNameAr = json['categories_name_ar'];
    categoriesNameEn = json['categories_name_en'];
    categoriesNameFr = json['categories_name_fr'];
    categoriesDatetime = json['categories_datetime'];
    favorite = json['favorite'];
    itemsPriceDiscount =
        double.parse(json['itemsPriceDiscount'].toStringAsFixed(2));
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
    data['items_count'] = itemsCount;
    data['items_active'] = itemsActive;
    data['items_price'] = itemsPrice;
    data['items_discount'] = itemsDiscount;
    data['items_datetime'] = itemsDatetime;
    data['items_categories'] = itemsCategories;
    data['categories_id'] = categoriesId;
    data['categories_name_ar'] = categoriesNameAr;
    data['categories_name_en'] = categoriesNameEn;
    data['categories_name_fr'] = categoriesNameFr;
    data['categories_datetime'] = categoriesDatetime;
    data['favorite'] = favorite;
    data['itemsPriceDiscount'] = itemsPriceDiscount;
    return data;
  }
}
