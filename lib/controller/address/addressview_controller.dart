import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rimzone_shop/core/class/statusrequest.dart';
import 'package:rimzone_shop/core/services/services.dart';

class ViewAddressController extends GetxController {
  AppServices appServices = Get.find();
  String? lang;
  String? usersID;
  StatusRequest statusRequest = StatusRequest.none;
  late Completer<GoogleMapController> completer;
  late Position position;
  late CameraPosition kGooglePlex;
  List<Marker> markers = [];
  late double lat;
  late double long;

  getCurrentPosition() async {
    statusRequest = StatusRequest.loading;
    update();
    position = await Geolocator.getCurrentPosition();
    lat = position.latitude;
    long = position.longitude;
    kGooglePlex = CameraPosition(
      target: LatLng(lat, long),
      zoom: 14.4746,
    );
    statusRequest = StatusRequest.none;
    update();
  }

  addMarkers(LatLng latLng) {
    markers.clear();
    markers.add(
      Marker(
        markerId: const MarkerId("1"),
        position: latLng,
      ),
    );
    lat = latLng.latitude;
    long = latLng.longitude;
    update();
  }

  CameraPosition kLake = const CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(37.43296265331129, -122.08832357078792),
    tilt: 59.440717697143555,
    zoom: 19.151926040649414,
  );

  addAddress() {}
  viewAddress() {}
  deleteAddress(String addressID) {}

  @override
  void onInit() {
    lang = appServices.sharedPreferences.getString("lang");
    usersID = appServices.sharedPreferences.getString("users_id");
    completer = Completer<GoogleMapController>();
    getCurrentPosition();
    super.onInit();
  }
}
