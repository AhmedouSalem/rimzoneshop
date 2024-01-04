import 'package:rimzone_shop/core/class/statusrequest.dart';

Future<StatusRequest> handlingData(response) async {
  if (response is StatusRequest) {
    return response;
  } else {
    return StatusRequest.success;
  }
}
