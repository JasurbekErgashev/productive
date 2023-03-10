import 'package:flutter/material.dart';
import 'package:productive/theme.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.tabHandler,
    required this.buttonChild,
    super.key,
  });

  final VoidCallback tabHandler;
  final Widget buttonChild;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: tabHandler,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        backgroundColor: MaterialStateProperty.all(
          AppColors.blueMediumBlue,
        ),
        foregroundColor: MaterialStateProperty.all(
          AppColors.white,
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
      child: buttonChild,
    );
  }
}
