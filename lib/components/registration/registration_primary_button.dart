import 'package:flutter/material.dart';

import '../../theme.dart';

class RegistrationPrimaryButton extends StatelessWidget {
  const RegistrationPrimaryButton({
    super.key,
    required this.tabHandler,
    required this.buttonText,
  });

  final VoidCallback tabHandler;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: tabHandler,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        backgroundColor: MaterialStateProperty.all(
          AppColors.blueMediumBlue,
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        minimumSize: MaterialStateProperty.all(
          Size(MediaQuery.of(context).size.width, 50),
        ),
      ),
      child: Text(
        buttonText,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
    );
  }
}
