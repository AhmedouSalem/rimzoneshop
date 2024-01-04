class CategoriesModel {
  int? categoriesId;
  String? categoriesNameAr;
  String? categoriesNameEn;
  String? categoriesNameFr;
  String? categoriesDatetime;

  CategoriesModel(
      {this.categoriesId,
      this.categoriesNameAr,
      this.categoriesNameEn,
      this.categoriesNameFr,
      this.categoriesDatetime});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    categoriesId = json['categories_id'];
    categoriesNameAr = json['categories_name_ar'];
    categoriesNameEn = json['categories_name_en'];
    categoriesNameFr = json['categories_name_fr'];
    categoriesDatetime = json['categories_datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['categories_id'] = categoriesId;
    data['categories_name_ar'] = categoriesNameAr;
    data['categories_name_en'] = categoriesNameEn;
    data['categories_name_fr'] = categoriesNameFr;
    data['categories_datetime'] = categoriesDatetime;
    return data;
  }
}
