import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:productive/app/navigation/app_route.dart';
import 'package:productive/app/navigation/navigator_module.dart';
import 'package:productive/app/ui/screens/login/login_screen_viewmodel.dart';
import 'package:productive/app/ui/screens/nav_pages/calendar/calendar_screen.dart';
import 'package:productive/app/ui/screens/nav_pages/expenses/expense_screen.dart';
import 'package:productive/app/ui/screens/nav_pages/stats/stats_screen.dart';
import 'package:productive/app/ui/screens/nav_pages/tasks/tasks_screen.dart';
import 'package:productive/app/ui/screens/onboarding/onboarding_screen.dart';
import 'package:productive/app/ui/screens/login/login_screen.dart';
import 'package:productive/app/ui/screens/register/register_screen.dart';
import 'package:productive/app/ui/screens/register/register_screen_viewmodel.dart';
import 'package:productive/app/ui/screens/root_screen.dart';
import 'package:productive/data/repositories/auth_repository.dart';
import 'package:productive/data/storage/user_storage.dart';

final userStorage = UserStorage();
final AuthenticationRepository authRepository = AuthenticationRepository();

final appRouter = GoRouter(
  initialLocation: userStorage.isFirstTime
      ? AppRoute.onboarding
      : authRepository.currentUser.isEmpty
          ? AppRoute.login
          : AppRoute.tasks,
  navigatorKey: NavigatorModule.rNavKey,
  routes: [
    GoRoute(
      path: AppRoute.onboarding,
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
        path: AppRoute.login,
        builder: (context, state) {
          return LoginScreen(
            viewModel: LoginScreenViewModel(),
          );
        }),
    GoRoute(
      path: AppRoute.register,
      builder: (context, state) {
        return RegisterScreen(viewModel: RegisterScreenViewModel());
      },
    ),
    ShellRoute(
      navigatorKey: NavigatorModule.sNavKey,
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return RootScreen(child: child);
      },
      routes: [
        GoRoute(
          path: AppRoute.tasks,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: const TasksScreen(),
              transitionDuration: Duration.zero,
              transitionsBuilder: (_, __, ___, child) => child,
            );
          },
          routes: const [
            // GoRoute(
            //   path: 'grades',
            //   pageBuilder: (BuildContext context, GoRouterState state) {
            //     return CustomTransitionPage(
            //       key: state.pageKey,
            //       child: GradesScreen(
            //         viewModel: GradesScreenViewModel(),
            //         extra: state.extra as ExtraGradeScreen,
            //       ),
            //       transitionDuration: const Duration(milliseconds: 300),
            //       transitionsBuilder: (_, a, sa, child) {
            //         var tween = Tween<double>(begin: 0.0, end: 1.0);
            //         var curvedAnimation = CurvedAnimation(
            //           parent: a,
            //           curve: Curves.fastOutSlowIn,
            //         );
            //         return ScaleTransition(
            //           scale: tween.animate(curvedAnimation),
            //           child: child,
            //         );
            //       },
            //     );
            //   },
            // ),
            // GoRoute(
            //   path: 'notifications',
            //   pageBuilder: (BuildContext context, GoRouterState state) {
            //     return CustomTransitionPage(
            //       key: state.pageKey,
            //       child: NotificationsScreen(
            //         viewModel: NotificationsScreenViewModel(),
            //       ),
            //       transitionDuration: const Duration(milliseconds: 300),
            //       transitionsBuilder: (_, a, sa, child) {
            //         var begin = const Offset(1.0, 0.0);
            //         var end = Offset.zero;
            //         var tween = Tween(begin: begin, end: end);
            //         return SlideTransition(
            //           position: tween.animate(a),
            //           child: child,
            //         );
            //       },
            //     );
            //   },
            // ),
          ],
        ),
        GoRoute(
          path: AppRoute.expenses,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: const ExpensesScreen(),
              transitionDuration: Duration.zero,
              transitionsBuilder: (_, __, ___, child) => child,
            );
          },
          routes: const [
            // GoRoute(
            //   path: 'qr-scanner',
            //   pageBuilder: (BuildContext context, GoRouterState state) {
            //     return CustomTransitionPage(
            //       key: state.pageKey,
            //       child: const QRViewScreen(),
            //       transitionDuration: Duration.zero,
            //       transitionsBuilder: (_, __, ___, child) => child,
            //     );
            //   },
            // ),
          ],
        ),
        GoRoute(
          path: AppRoute.calendar,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: const CalendarScreen(),
              transitionDuration: Duration.zero,
              transitionsBuilder: (_, __, ___, child) => child,
            );
          },
        ),
        GoRoute(
          path: AppRoute.stats,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: const StatsScreen(),
              transitionDuration: Duration.zero,
              transitionsBuilder: (_, __, ___, child) => child,
            );
          },
        ),
      ],
    ),
  ],
);
