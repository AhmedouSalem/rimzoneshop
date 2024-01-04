import 'package:flutter/material.dart';

class CustomBodyTextAuth extends StatelessWidget {
  const CustomBodyTextAuth({super.key, required this.bodyText});
  final String bodyText;

  @override
  Widget build(BuildContext context) {
    return Text(
      bodyText,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}
