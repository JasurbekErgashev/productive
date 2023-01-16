import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './screens/onboarding_screen.dart';
import './theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const Productive());
}

class Productive extends StatelessWidget {
  const Productive({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Productive',
      theme: ProductiveTheme.theme(),
      home: const OnboardingScreen(),
    );
  }
}
