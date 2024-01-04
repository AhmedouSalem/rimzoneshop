import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  type = type.capitalizeFirst!;
  if (val.isEmpty) {
    return "${type.tr} ${"isEmpty".tr}";
  } else {
    if (val.length < min) {
      return "${type.tr} ${"lessThan".tr} $min";
    }
    if (val.length > max) {
      return "${type.tr} ${"greaterThan".tr}  $max";
    }
    if (type.toLowerCase() == "username") {
      if (!GetUtils.isUsername(val.trim())) {
        return "${"Username".tr}" "${" "}" "${"notValid".tr.toLowerCase()}";
      }
    }
    if (type.toLowerCase() == "email") {
      if (!GetUtils.isEmail(val.trim())) {
        return "${"Email".tr}" "${" "}" "${"notValid".tr.toLowerCase()}";
      }
    }
    if (type.toLowerCase() == "phone") {
      if (!GetUtils.isPhoneNumber("+222${val.trim()}")) {
        return "${"Phone".tr}" "${" "}" "${"notValid".tr.toLowerCase()}";
      }
    }

    if (type.toLowerCase() == "password") {
      if (!GetUtils.hasMatch(val,
          r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%?&])[A-Za-z\d@$!%?&]{8,}$')) {
        return "${"Le".tr} ${"Password".tr} ${"isWeak".tr}";
      }
    }
  }
  return "";
}
