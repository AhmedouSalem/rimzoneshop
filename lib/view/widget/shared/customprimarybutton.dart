import 'package:flutter/material.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';

class CustomButtonPrimary extends StatelessWidget {
  const CustomButtonPrimary({
    super.key,
    required this.buttonColor,
    required this.textButton,
    required this.textColor,
    required this.margin,
    this.onPressed,
    required this.isLoading,
    this.borderRadius,
  });
  final Color buttonColor;
  final String textButton;
  final Color textColor;
  final EdgeInsetsGeometry? margin;
  final void Function()? onPressed;
  final bool isLoading;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: 45.0,
      width: double.infinity,
      child: MaterialButton(
        disabledColor: buttonColor == AppColor.primaryColor
            ? const Color.fromRGBO(2, 101, 255, 0.5)
            : const Color.fromRGBO(255, 255, 255, 0.3),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        highlightElevation: 0.0,
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(15.0),
          side: buttonColor == AppColor.primaryColor
              ? BorderSide.none
              : BorderSide(color: textColor),
        ),
        textColor: textColor,
        color: buttonColor,
        onPressed: onPressed,
        child: isLoading
            ? CircularProgressIndicator(
                color: buttonColor == AppColor.primaryColor
                    ? AppColor.secondColor
                    : AppColor.primaryColor,
              )
            : Text(
                textButton,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
      ),
    );
  }
}
