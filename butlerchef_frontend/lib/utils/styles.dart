import 'package:flutter/material.dart';
import 'package:butler_chef/utils/app_colors.dart';

class ThemeText {
  static const TextStyle addressTitle = TextStyle(
      color: AppColors.green,
      fontSize: 30,
      letterSpacing: 4,
      fontWeight: FontWeight.w700);

  static const TextStyle addressSubtitle = TextStyle(
      color: AppColors.green, fontSize: 20, fontWeight: FontWeight.w300);

  static const TextStyle addressInput = TextStyle(
      fontWeight: FontWeight.normal, fontSize: 20, color: AppColors.brown);
}
