import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rimzone_shop/controller/checkoutcontroller.dart';
import 'package:rimzone_shop/core/class/handlingdataview.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';
import 'package:rimzone_shop/view/widget/checkout/addaddressform.dart';

class CustomDialogCheckout extends StatelessWidget {
  const CustomDialogCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutControllerImplement>(
      builder: (controller) => WillPopScope(
        onWillPop: controller.willBackOnCloseDialog,
        child: Container(
          margin: const EdgeInsets.all(20.0),
          height: Get.height * 2,
          width: Get.width,
          color: AppColor.secondColor,
          child: Column(
            children: [
              Expanded(
                child: controller.completed
                    ? const Material(
                        child: Padding(
                            padding: EdgeInsets.all(15.0),
                            child: CustomAddAddressForm()),
                      )
                    : HandlingDataView(
                        statusRequest: controller.statusRequest,
                        widget: GoogleMap(
                          onTap: (latLng) {
                            controller.addMarkers(latLng);
                          },
                          markers: controller.markers.toSet(),
                          myLocationEnabled: true,
                          myLocationButtonEnabled: true,
                          mapToolbarEnabled: true,
                          mapType: MapType.normal,
                          initialCameraPosition: controller.kGooglePlex,
                          onMapCreated:
                              (GoogleMapController googleMapController) {
                            if (!controller.completer.isCompleted) {
                              controller.completer
                                  .complete(googleMapController);
                              controller.checkOpenMap();
                            }
                          },
                        ),
                      ),
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      child: MaterialButton(
                        color: Colors.grey,
                        textColor: AppColor.secondColor,
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        onPressed: () {
                          Get.back();
                          controller.closeDialog();
                        },
                        child: Text("Close".tr),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      child: MaterialButton(
                        disabledColor: const Color.fromRGBO(2, 101, 255, 0.5),
                        color: AppColor.primaryColor.withOpacity(0.8),
                        textColor: AppColor.secondColor,
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        onPressed:
                            controller.completed || !controller.isOpenMaps
                                // || controller.markers.isEmpty
                                ? null
                                : () {
                                    controller.insertAddressDetails();
                                  },
                        child: Text("Completed".tr),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
