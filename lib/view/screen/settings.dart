import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rimzone_shop/controller/settings_controller.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';
import 'package:rimzone_shop/core/constant/appimageasset.dart';
import 'package:rimzone_shop/core/localization/applocale_controller.dart';
import 'package:rimzone_shop/view/widget/language/customlanguagetile.dart';
import 'package:rimzone_shop/view/widget/shared/customprimarybutton.dart';
import 'package:rimzone_shop/view/widget/shared/customtitletext.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsDefaultHomePage extends StatelessWidget {
  const SettingsDefaultHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsControllerImplement settingsControllerImplement =
        Get.put(SettingsControllerImplement());
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UserAccountsDrawerHeader(
          currentAccountPicture: CircleAvatar(
            child: Text(settingsControllerImplement.username[0]),
          ),
          accountName: Text(settingsControllerImplement.username),
          accountEmail: Text(settingsControllerImplement.email),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: ListView(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTitleText(title: "General".tr),
                    ListTile(
                      onTap: () {},
                      title: Text(
                        "changePassword".tr,
                      ),
                      trailing: const Icon(Icons.password_outlined),
                    ),
                    // ListTile(
                    //   onTap: () {
                    //     settingsControllerImplement.goToAddress();
                    //   },
                    //   title: Text(
                    //     "Address".tr,
                    //     textAlign: TextAlign.left,
                    //   ),
                    //   trailing: const Icon(Icons.location_on_outlined),
                    // ),
                    ListTile(
                      onTap: () {
                        settingsControllerImplement.goToOrders();
                      },
                      title: Text(
                        "orders".tr,
                      ),
                      trailing: Image.asset(
                        AppImageAsset.shoppingBag,
                        width: 25.0,
                        height: 25.0,
                        color: AppColor.colorGrey,
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Get.dialog(
                          Dialog(
                            child: GetBuilder<AppLocaleControllerImplement>(
                              builder: (controller) => Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CustomLanguageTile(
                                    languageCode: "ar",
                                    language: "Arabic".tr,
                                  ),
                                  const Divider(
                                    thickness: 1,
                                    height: 0.0,
                                  ),
                                  CustomLanguageTile(
                                    languageCode: "fr",
                                    language: "French".tr,
                                  ),
                                  const Divider(
                                    thickness: 1,
                                    height: 0.0,
                                  ),
                                  CustomLanguageTile(
                                    languageCode: "en",
                                    language: "English".tr,
                                  ),
                                  const Divider(
                                    thickness: 1,
                                    height: 0.0,
                                  ),
                                  CustomButtonPrimary(
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(15.0),
                                      bottomRight: Radius.circular(15.0),
                                    ),
                                    buttonColor: AppColor.primaryColor,
                                    textButton: "Continue".tr,
                                    textColor: AppColor.secondColor,
                                    margin: EdgeInsets.zero,
                                    onPressed: controller.isLoading
                                        ? null
                                        : () async {
                                            controller.changeLangue(
                                                controller.language);
                                            await Future.delayed(
                                              const Duration(
                                                  milliseconds: 1000),
                                            );
                                            Get.back();
                                            // controller.goToOnboarding();
                                          },
                                    isLoading: controller.isLoading,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      title: Text(
                        "language".tr,
                      ),
                      trailing: const Icon(Icons.language_outlined),
                    ),
                    ListTile(
                      onTap: () {
                        settingsControllerImplement.exitToApp();
                      },
                      title: Text(
                        "logout".tr,
                      ),
                      trailing: const Icon(Icons.exit_to_app),
                    ),
                    CustomTitleText(title: "Personalization".tr),
                    ListTile(
                      onTap: () {},
                      title: Text(
                        "Notifications".tr,
                      ),
                      trailing: const Icon(Icons.circle_notifications_outlined),
                      subtitle: const Text("Off"),
                    ),
                    CustomTitleText(title: "Support".tr),
                    ListTile(
                      onTap: () {},
                      title: Text(
                        "About".tr,
                      ),
                      trailing: const Icon(Icons.help_outline_outlined),
                    ),
                    ListTile(
                      onTap: () async {
                        await launchUrl(Uri.parse("tel:+22236977373"));
                      },
                      title: Text(
                        "contactUS".tr,
                      ),
                      trailing: const Icon(Icons.contact_support_outlined),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
