import 'package:go_router/go_router.dart';
import 'package:productive/app/navigation/app_route.dart';
import 'package:productive/app/ui/screens/home/home_screen.dart';
import 'package:productive/app/ui/screens/notifications/notifications_screen.dart';
import 'package:productive/app/ui/screens/quick_notes/quick_notes_screen.dart';
import 'package:productive/app/ui/screens/register/forgot_password_screen.dart';
import 'package:productive/app/ui/screens/register/login_screen.dart';
import 'package:productive/app/ui/screens/register/signup_screen.dart';

final appRouter = GoRouter(
  initialLocation: AppRoute.home,
  routes: [
    // GoRoute(
    //   path: AppRoute.root,
    //   builder: (context, state) => SplashScreen(),
    // ),
    GoRoute(
      path: AppRoute.register,
      builder: (context, state) => const SignUpScreen(),
      routes: const [
        // GoRoute(
        //   path: 'otp',
        //   builder: (context, state) => RegisterOtpScreen(),
        // ),
        // GoRoute(
        //   path: 'password',
        //   builder: (context, state) => RegisterPasswordScreen(),
        // ),
        // GoRoute(
        //   path: 'details',
        //   builder: (context, state) => RegisterDetailsScreen(),
        // ),
      ],
    ),
    GoRoute(
      path: AppRoute.login,
      builder: (context, state) => const LoginScreen(),
      routes: [
        // TODO: Email verification and create new password screen probably not used later
        // Since, firebase provided this features itself on a web format
        GoRoute(
          path: 'forgotPassword',
          builder: (context, state) => const ForgotPasswordScreen(),
        ),
      ],
    ),
    GoRoute(
      path: AppRoute.home,
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'notifications',
          builder: (context, state) => const NotificationsScreen(),
        ),
        GoRoute(
          path: 'quickNotes',
          builder: (context, state) => const QuickNotesScreen(),
        ),
        // GoRoute(
        //   path: 'securitySettings',
        //   builder: (context, state) => SecurityScreen(),
        // ),
      ],
    ),
  ],
);
