import 'package:flutter/material.dart';

class SignUpModel {
  final String title;
  final String body;
  final String? labelText;
  final IconData? suffixIcon;
  final int minLength;
  final int maxLength;
  final String type;
  SignUpModel({
    required this.title,
    required this.body,
    required this.labelText,
    this.suffixIcon,
    required this.minLength,
    required this.maxLength,
    required this.type,
  });
}
