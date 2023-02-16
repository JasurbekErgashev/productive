import 'package:flutter/material.dart';
import 'package:productive/theme.dart';

class OnboardingPageContent extends StatelessWidget {
  const OnboardingPageContent({
    required this.imagePath,
    required this.title,
    required this.subTitle,
    super.key,
  });

  final String imagePath;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 50),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.w600,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            subTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.white.withOpacity(0.5),
              fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
