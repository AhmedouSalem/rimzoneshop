import 'dart:io';

Future<bool> checkInternet() async {
  try {
    List<InternetAddress> internetAddress = await InternetAddress.lookup(
      "10.42.0.95",
      type: InternetAddressType.any,
    );
    if (internetAddress.isNotEmpty &&
        internetAddress[0].rawAddress.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  } catch (_) {
    return false;
  }
}


// 172.20.10.3