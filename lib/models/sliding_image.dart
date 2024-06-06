import 'package:flutter/material.dart';

class SlidingImage {
  String assetPath;
  String title;
  String description;
  String buttonText;
  VoidCallback onButtonPressed;

  SlidingImage({
    required this.assetPath,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.onButtonPressed,
  });
}
