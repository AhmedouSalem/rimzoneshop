import 'package:get/get.dart';
import 'package:rimzone_shop/core/localization/arabe.dart';
import 'package:rimzone_shop/core/localization/english.dart';
import 'package:rimzone_shop/core/localization/frensh.dart';

class AppTranslation implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "en": englishTranslation,
        "fr": frenchTranslation,
        "ar": arabicTranslation,
      };
}
