import 'package:flutter/material.dart';

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
      margin: const EdgeInsets.only(bottom: 20.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: AppColor.secondColor,
        border: Border.all(
          color: borderColor ?? const Color(0xFF000000),
          width: isAutoFocus == true ? 1.3 : 1,
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
      height: 60,
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
              style: const TextStyle(
                  fontSize: 14.7, height: 1.0, decoration: TextDecoration.none),
              focusNode: focusNode,
              keyboardType: keyboardType,
              autofocus:
                  isAutoFocus == null || isAutoFocus == false ? false : true,
              controller: textEditingController,
              obscureText: boolObscureText == false ? false : true,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(bottom: 8.0),
                labelText: labelText,
                labelStyle: TextStyle(fontSize: fontSize, color: labelColor),
                floatingLabelStyle: TextStyle(
                    color: labelColor, fontSize: fontSize, height: 1.0),
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
