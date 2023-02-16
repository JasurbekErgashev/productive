import 'package:flutter/material.dart';
import 'package:productive/theme.dart';

InputDecoration customInputDecoration({
  required String hintText,
  Widget? suffixIcon,
  bool? isPassword,
}) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: TextStyle(
      color: AppColors.white.withOpacity(0.6),
      fontWeight: FontWeight.w400,
      fontSize: 14,
      letterSpacing: isPassword != null ? 0 : null,
    ),
    filled: true,
    fillColor: AppColors.blueDarkBlue2,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: const Color(0xFF006EE9).withOpacity(0.1),
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: const Color(0xFF006EE9).withOpacity(0.5),
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: Colors.red,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: Colors.red,
      ),
    ),
    suffixIcon: suffixIcon,
  );
}
