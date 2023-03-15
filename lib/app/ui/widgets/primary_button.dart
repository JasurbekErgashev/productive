import 'package:flutter/material.dart';
import 'package:productive/app/ui/widgets/app_circular_progress_indicator.dart';
import 'package:productive/theme.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.tabHandler,
    required this.buttonChild,
    this.isLoading = false,
    super.key,
  });

  final VoidCallback tabHandler;
  final Widget buttonChild;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? () {} : tabHandler,
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
      child: isLoading ? const AppCircularProgressIndicator() : buttonChild,
    );
  }
}
