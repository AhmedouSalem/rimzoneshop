import 'package:flutter/material.dart';
import 'package:rimzone_shop/core/constant/appimageasset.dart';
import 'package:rimzone_shop/data/model/carddeliverytype_model.dart';
import 'package:rimzone_shop/data/model/checkoutstep_model.dart';
import 'package:rimzone_shop/data/model/onboardingtopmodel.dart';
import 'package:rimzone_shop/data/model/signupmodel.dart';
import 'package:get/get.dart';

import '../../model/onboardingbottommodel.dart';

List<OnBoardingTopModel> onboardingImageList = [
  OnBoardingTopModel(photo: AppImageAsset.onboardingOne),
  OnBoardingTopModel(photo: AppImageAsset.onboardingTwo),
  OnBoardingTopModel(photo: AppImageAsset.onboardingThree),
];

List<OnBoardingBottomModel> onboardingBottomList = [
  OnBoardingBottomModel(
    title: "onBoardingTitle1".tr,
    body: "onBoardingBody1".tr,
    textButton: "Next".tr,
  ),
  OnBoardingBottomModel(
    title: "onBoardingTitle2".tr,
    body: "onBoardingBody2".tr,
    textButton: "Next".tr,
  ),
  OnBoardingBottomModel(
    title: "onBoardingTitle3".tr,
    body: "onBoardingBody3".tr,
    textButton: "letsGo".tr,
  ),
];

List<SignUpModel> signUpPageViewList = [
  SignUpModel(
    title: "SignUpTitle1".tr,
    body: "SignUpBody1".tr,
    labelText: "Username".tr,
    suffixIcon: Icons.person_outline_outlined,
    minLength: 3,
    maxLength: 100,
    type: 'Username'.toLowerCase(),
  ),
  SignUpModel(
    title: "SignUpTitle2".tr,
    body: "SignUpBody2".tr,
    labelText: "Email".tr,
    suffixIcon: Icons.email_outlined,
    minLength: 3,
    maxLength: 70,
    type: 'Email'.toLowerCase(),
  ),
  SignUpModel(
    title: "SignUpTitle3".tr,
    body: "SignUpBody3".tr,
    labelText: "Phone".tr,
    suffixIcon: Icons.phone_android_outlined,
    minLength: 8,
    maxLength: 8,
    type: 'Phone'.toLowerCase(),
  ),
  SignUpModel(
    title: "SignUpTitle4".tr,
    body: "SignUpBody4".tr,
    labelText: "Password".tr,
    minLength: 8,
    maxLength: 70,
    type: 'Password'.toLowerCase(),
  ),
  SignUpModel(
    title: "SignUpTitle5".tr,
    body: "SignUpBody5".tr,
    labelText: "${"Confirm".tr} ${"Le".tr} ${"Password".tr.toLowerCase()}",
    minLength: 8,
    maxLength: 70,
    type: "confirmPassword",
  ),
];

List<CardDeliveryTypeModel> cardDeliveryType = [
  CardDeliveryTypeModel(
    id: "0",
    title: "atStore".tr,
    subtitle: "onSpace".tr,
    imageName: AppImageAsset.deliveryMan,
  ),
  CardDeliveryTypeModel(
    id: "1",
    title: "standardDelivery".tr,
    subtitle: "delivery".tr,
    imageName: AppImageAsset.standardDelivery,
  ),
];

List<CardDeliveryTypeModel> cardPaymentMethod = [
  CardDeliveryTypeModel(
    id: "0",
    imageName: AppImageAsset.cardPayment,
    subtitle: "creditCard".tr,
  ),
  CardDeliveryTypeModel(
    id: "1",
    imageName: AppImageAsset.cashPayment,
    subtitle: "cash".tr,
  ),
];

List<CheckOutStepModel> checkoutStep = [
  CheckOutStepModel(imageName: AppImageAsset.box, title: "Shipping".tr),
  CheckOutStepModel(imageName: AppImageAsset.creditCard, title: "Payment".tr),
  CheckOutStepModel(imageName: AppImageAsset.shoppingBag, title: "Reviews".tr),
];
