import 'package:flutter/material.dart';
import 'package:productive/theme.dart';

InputDecoration customInputDecoration({
  required String hintText,
  Widget? suffixIcon,
  bool? isPassword,
}) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: AppTypography.pWhiteOpac50.copyWith(
      letterSpacing: isPassword != null ? 0 : null,
    ),
    filled: true,
    fillColor: AppColors.blueDarkBlue2,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: AppColors.blueOpac1,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: AppColors.blueOpac5,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: AppColors.red,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: AppColors.red,
      ),
    ),
    suffixIcon: suffixIcon,
  );
}
