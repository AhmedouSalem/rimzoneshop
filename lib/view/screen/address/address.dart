import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rimzone_shop/controller/address/addressview_controller.dart';
import 'package:rimzone_shop/core/class/handlingdataview.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ViewAddressController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Address"),
        centerTitle: true,
        backgroundColor: AppColor.primaryColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<ViewAddressController>(
              builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: GoogleMap(
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  mapToolbarEnabled: true,
                  mapType: MapType.normal,
                  initialCameraPosition: controller.kGooglePlex,
                  onMapCreated: (GoogleMapController googleMapController) {
                    controller.completer.complete(googleMapController);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
