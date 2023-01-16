import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../theme.dart';
import '../screens/home_screen.dart';
import '../components/onboarding/page_content.dart';
import '../components/onboarding/navigation_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _controller = PageController();

  bool isFirstPage = true;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.dark,
        actions: [
          TextButton(
            onPressed: () async {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            },
            child: Text(
              'SKIP',
              style: TextStyle(
                color: AppColors.blueMediumBlue,
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
      body: PageView(
        controller: _controller,
        onPageChanged: (index) {
          setState(() {
            isFirstPage = index == 0;
          });
        },
        children: const [
          OnboardingPageContent(
            imagePath: 'assets/images/onboarding_1.png',
            title: 'Easy Time Management',
            subTitle: 'We help you stay organized and manage your day',
          ),
          OnboardingPageContent(
            imagePath: 'assets/images/onboarding_2.png',
            title: 'Track Your Expense',
            subTitle: 'We help you organize your expenses easily and safely',
          ),
        ],
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        height: 80,
        color: AppColors.dark,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Opacity(
              opacity: isFirstPage ? 0 : 1,
              child: OnBoardingNavigationButton(
                tabHandler: isFirstPage
                    ? null
                    : () => _controller.previousPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        ),
                icon: Icons.chevron_left_rounded,
              ),
            ),
            SmoothPageIndicator(
              controller: _controller,
              onDotClicked: (index) {
                _controller.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              },
              effect: ExpandingDotsEffect(
                dotColor: AppColors.blueMediumBlue.withOpacity(0.32),
                activeDotColor: AppColors.blueMediumBlue,
                dotHeight: 8,
                dotWidth: 8,
                spacing: 4,
                radius: 12,
              ),
              count: 2,
            ),
            OnBoardingNavigationButton(
              tabHandler: !isFirstPage
                  ? () async {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    }
                  : () => _controller.nextPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      ),
              icon: Icons.chevron_right_rounded,
            ),
          ],
        ),
      ),
    );
  }
}
