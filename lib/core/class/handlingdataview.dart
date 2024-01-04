import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rimzone_shop/core/class/statusrequest.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';
import 'package:rimzone_shop/core/constant/appimageasset.dart';
import 'package:rimzone_shop/view/widget/shared/customprimarybutton.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  final String? loading;
  const HandlingDataView({
    super.key,
    required this.statusRequest,
    required this.widget,
    this.loading,
  });

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(loading ?? AppImageAsset.lottieLoading,
                width: 250, height: 250),
          )
        : statusRequest == StatusRequest.failure
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Lottie.asset(AppImageAsset.lottieNoData,
                        width: 250, height: 250),
                  ),
                ],
              )
            : statusRequest == StatusRequest.offlineFailure
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Lottie.asset(AppImageAsset.lottieOffline,
                            width: 250, height: 250),
                      ),
                    ],
                  )
                : statusRequest == StatusRequest.serverFailure
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Lottie.asset(AppImageAsset.lottieServer,
                                width: 250, height: 250),
                          ),
                        ],
                      )
                    : statusRequest == StatusRequest.serverException
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Lottie.asset(
                                    AppImageAsset.lottieException,
                                    width: 250,
                                    height: 250),
                              ),
                            ],
                          )
                        : widget;
  }
}

class HandlingRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  final void Function()? onPressedRefresh;
  const HandlingRequest(
      {super.key,
      required this.statusRequest,
      required this.widget,
      this.onPressedRefresh});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(AppImageAsset.lottieLoading,
                width: 250, height: 250),
          )
        : statusRequest == StatusRequest.offlineFailure
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Lottie.asset(AppImageAsset.lottieOffline,
                        width: 250, height: 250),
                  ),
                  CustomButtonPrimary(
                    buttonColor: AppColor.primaryColor,
                    textButton: "Refresh",
                    textColor: AppColor.secondColor,
                    margin: const EdgeInsets.symmetric(horizontal: 50.0),
                    isLoading: false,
                    onPressed: onPressedRefresh,
                  )
                ],
              )
            : statusRequest == StatusRequest.serverFailure
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Lottie.asset(AppImageAsset.lottieServer,
                            width: 250, height: 250),
                      ),
                      CustomButtonPrimary(
                        buttonColor: AppColor.primaryColor,
                        textButton: "Refresh",
                        textColor: AppColor.secondColor,
                        margin: const EdgeInsets.symmetric(horizontal: 50.0),
                        isLoading: false,
                        onPressed: onPressedRefresh,
                      )
                    ],
                  )
                : statusRequest == StatusRequest.serverException
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Lottie.asset(AppImageAsset.lottieException,
                                width: 250, height: 250),
                          ),
                          CustomButtonPrimary(
                            buttonColor: AppColor.primaryColor,
                            textButton: "Refresh",
                            textColor: AppColor.secondColor,
                            margin:
                                const EdgeInsets.symmetric(horizontal: 50.0),
                            isLoading: false,
                            onPressed: onPressedRefresh,
                          )
                        ],
                      )
                    : widget;
  }
}

class HandlingMapsCart extends StatelessWidget {
  final bool isOpenMap;
  final Widget widget;
  const HandlingMapsCart({
    super.key,
    required this.isOpenMap,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return isOpenMap ? widget : Lottie.asset(AppImageAsset.lottieLoading);
  }
}
