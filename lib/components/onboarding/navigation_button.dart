import 'package:flutter/material.dart';

import '../../theme.dart';

class OnBoardingNavigationButton extends StatelessWidget {
  const OnBoardingNavigationButton({
    super.key,
    required this.tabHandler,
    required this.icon,
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
        minimumSize: MaterialStateProperty.all(const Size(44, 44)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
      ),
      onPressed: tabHandler,
      child: Icon(icon),
    );
  }
}
