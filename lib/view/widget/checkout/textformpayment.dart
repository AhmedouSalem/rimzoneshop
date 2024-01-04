import 'package:flutter/material.dart';

class CustomTextFormPayment extends StatelessWidget {
  const CustomTextFormPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        isDense: true,
        hintText: "XXX",
        border: OutlineInputBorder(),
      ),
    );
  }
}
