import 'package:flutter/material.dart';

import '../../theme.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    super.key,
    required this.tabHandler,
    required this.imagePath,
  });

  final VoidCallback tabHandler;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: tabHandler,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          AppColors.blueBlueBlack,
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        minimumSize: MaterialStateProperty.all(
          const Size(60, 40),
        ),
        elevation: MaterialStateProperty.all(0),
      ),
      child: SizedBox(
        height: 24,
        width: 24,
        child: Image.asset(imagePath),
      ),
    );
  }
}
