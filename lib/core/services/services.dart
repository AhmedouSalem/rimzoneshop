import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:rimzone_shop/controller/orders/orders_controller.dart';
import 'package:rimzone_shop/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

class AppServices extends GetxService {
  late SharedPreferences sharedPreferences;

  Future determinePosition() async {
    // bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    // serviceEnabled = await Geolocator.isLocationServiceEnabled();
    // if (!serviceEnabled) {
    //   Get.snackbar('Position', 'Location services are disabled.');
    // }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar('Position', 'Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Get.snackbar("Position",
          'Location permissions are permanently denied, we cannot request permissions.');
    }
  }

  Future<StreamSubscription<RemoteMessage>> fcmMessage() async {
    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    StreamSubscription<RemoteMessage> remoteMessage =
        FirebaseMessaging.onMessage.listen((message) {
      FlutterRingtonePlayer().play(
        android: AndroidSounds.notification,
        ios: IosSounds.glass,
        looping: false, // Android only - API >= 28
        volume: 0.1, // Android only - API >= 28
        asAlarm: false, // Android only - all APIs
      );
      Get.snackbar(message.notification!.title!, message.notification!.body!);
      if (message.data["pageName"] == Get.currentRoute) {
        OrdersControllerImplement controller = Get.find();
        controller.refreshPage();
      }
    });
    return remoteMessage;
  }

  Future<AppServices> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    sharedPreferences = await SharedPreferences.getInstance();
    await determinePosition();
    // await fcmMessage();
    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => AppServices().init());
}
