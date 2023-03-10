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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: AppTypography.onbTitleStyle,
              ),
              const SizedBox(height: 5),
              Text(
                subTitle,
                textAlign: TextAlign.center,
                style: AppTypography.onbSubTitleStyle,
              ),
            ],
          ),
          const SizedBox(height: 80),
        ],
      ),
    );
  }
}
