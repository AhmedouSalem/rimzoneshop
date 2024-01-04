import 'package:flutter/material.dart';

class CustomUserEvaluationFavorite extends StatelessWidget {
  final IconData iconData;
  final dynamic value;
  final Color? iconColor;
  const CustomUserEvaluationFavorite({
    super.key,
    required this.iconData,
    required this.value,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          iconData,
          color: iconColor,
        ),
        const SizedBox(
          width: 2.0,
        ),
        Text(
          "$value%",
          // style: const TextStyle(fontFamily: "Cairo"),
        ),
      ],
    );
  }
}
