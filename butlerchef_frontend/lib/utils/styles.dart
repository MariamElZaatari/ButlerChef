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

  static const TextStyle productName = TextStyle(
      fontWeight: FontWeight.w500, fontSize: 20, color: AppColors.brown);

  static const TextStyle quantityMeasurement = TextStyle(
      fontWeight: FontWeight.normal, fontSize: 20, color: AppColors.green);

  static const TextStyle directionTitle = TextStyle(
      fontWeight: FontWeight.w700, fontSize: 30, color: AppColors.green, letterSpacing: 2);

  static const TextStyle directionContent = TextStyle(
      fontWeight: FontWeight.w300, fontSize: 20, color: AppColors.brown, letterSpacing: 1);
}
