import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:productive/registration_screens/home_screen.dart';

import './theme.dart';
// import 'registration_screens/onboarding_screen.dart';
// import 'registration_screens/login_screen.dart';
import './main_screens/home_screen.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class Productive extends StatelessWidget {
  const Productive({super.key, required this.isFirstLaunched});
  final bool isFirstLaunched;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Productive',
      theme: ProductiveTheme.theme(),
      home: const HomeScreen(),
      // !isFirstLaunched
      //     ? const OnboardingScreen()
      //     : StreamBuilder<User?>(
      //         stream: FirebaseAuth.instance.authStateChanges(),
      //         builder: (context, snapshot) {
      //           if (snapshot.connectionState == ConnectionState.waiting) {
      //             return const Center(
      //               child: CircularProgressIndicator(color: Colors.white),
      //             );
      //           } else if (snapshot.hasError) {
      //             return const Center(
      //               child: Text(
      //                 'Something Went Wrong',
      //                 style: TextStyle(color: Colors.white),
      //               ),
      //             );
      //           }
      //           if (snapshot.hasData) {
      //             return const HomeScreen();
      //           } else {
      //             return const LoginScreen();
      //           }
      //         },
      //       ),
    );
  }
}
