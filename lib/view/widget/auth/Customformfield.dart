import 'package:flutter/material.dart';
import 'package:rimzone_shop/view/widget/shared/shared.dart';

import '../../../core/constant/appcolor.dart';

class CustomTextFormFieldAuth extends StatelessWidget {
  const CustomTextFormFieldAuth({
    super.key,
    required this.textEditingController,
    this.suffixIcon,
    this.labelText,
    required this.boolObscureText,
    this.onTapIcon,
    this.isAutoFocus,
    this.keyboardType,
    this.focusNode,
    this.onTapField,
    this.validator,
    this.iconColor,
    this.borderColor,
    this.labelColor,
    this.onChanged,
    this.fontSize,
  });
  final TextEditingController textEditingController;
  final IconData? suffixIcon;
  final String? labelText;
  final bool? isAutoFocus;
  final bool boolObscureText;
  final Function()? onTapIcon;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final void Function()? onTapField;
  final String? Function(String?)? validator;
  final Color? iconColor;
  final Color? borderColor;
  final Color? labelColor;
  final void Function(String)? onChanged;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.only(bottom: AppResponsive.fullWidth * 0.05),
      padding:  EdgeInsets.all(AppResponsive.fullHeight * 0.015),
      decoration: BoxDecoration(
        color: AppColor.secondColor,
        border: Border.all(
          color: borderColor ?? const Color(0xFF000000),
          width: isAutoFocus == true ? 1.3 : 1,
        ),
        borderRadius: BorderRadius.circular(AppResponsive.fullHeight * 0.02),
      ),
      height: AppResponsive.fullHeight * 0.07,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 10,
            child: TextFormField(
              onChanged: onChanged,
              validator: validator,
              onTap: onTapField,
              style:  TextStyle(
                  fontSize: AppResponsive.fullHeight * 0.025, height: AppResponsive.fullWidth * 0.003, decoration: TextDecoration.none),
              focusNode: focusNode,
              keyboardType: keyboardType,
              autofocus:
                  isAutoFocus == null || isAutoFocus == false ? false : true,
              controller: textEditingController,
              obscureText: boolObscureText == false ? false : true,
              decoration: InputDecoration(
                contentPadding:  EdgeInsets.only(bottom: AppResponsive.fullHeight * 0.01),
                labelText: labelText,
                labelStyle: TextStyle(fontSize: fontSize, color: labelColor),
                floatingLabelStyle: TextStyle(
                    color: labelColor, fontSize: fontSize, height: 0.5,),
                border: InputBorder.none,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: InkWell(
                onTap: onTapIcon,
                child: Icon(
                  suffixIcon,
                  color: iconColor,
                )),
          ),
        ],
      ),
    );
  }
}
