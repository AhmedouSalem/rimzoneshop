import 'dart:io';

Future<bool> checkInternet() async {
  try {
    List<InternetAddress> internetAddress = await InternetAddress.lookup(
        "172.20.10.3",
        type: InternetAddressType.IPv4);
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