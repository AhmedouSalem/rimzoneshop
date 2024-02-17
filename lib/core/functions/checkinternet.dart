import 'dart:io';

Future<bool> checkInternet() async {
  try {
    List<InternetAddress> internetAddress = await InternetAddress.lookup(
      "google.com",
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