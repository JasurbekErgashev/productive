import 'package:flutter/material.dart';
import 'package:productive/theme.dart';

class OnBoardingNavigationButton extends StatelessWidget {
  const OnBoardingNavigationButton({
    required this.tabHandler,
    required this.icon,
    super.key,
  });

  final VoidCallback? tabHandler;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          AppColors.blueMediumBlue,
        ),
        foregroundColor: MaterialStateProperty.all(
          AppColors.white,
        ),
        minimumSize: MaterialStateProperty.all(const Size(44, 44)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        padding: MaterialStateProperty.all(EdgeInsets.zero),
      ),
      onPressed: tabHandler,
      child: Icon(icon),
    );
  }
}
