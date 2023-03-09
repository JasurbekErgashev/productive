import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:productive/app/navigation/app_route.dart';
import 'package:productive/theme.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({required this.child, super.key});

  final Widget child;

  @override
  State<RootScreen> createState() => _RootScreenState();

  static int _calculateSelectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).location;
    if (location.startsWith(AppRoute.tasks)) {
      return 0;
    }
    if (location.startsWith(AppRoute.expenses)) {
      return 1;
    }
    if (location.startsWith(AppRoute.calendar)) {
      return 2;
    }
    if (location.startsWith(AppRoute.stats)) {
      return 3;
    }
    return 0;
  }
}

class _RootScreenState extends State<RootScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (index) => _onItemTapped(index, context),
        selectedIndex: RootScreen._calculateSelectedIndex(context),
        destinations: const [
          NavigationDestination(
            icon: FaIcon(FontAwesomeIcons.listCheck),
            label: 'Tasks',
          ),
          NavigationDestination(
            icon: FaIcon(FontAwesomeIcons.moneyBill),
            label: 'Expenses',
          ),
          NavigationDestination(
            icon: FaIcon(FontAwesomeIcons.calendarDay),
            label: 'Calendar',
          ),
          NavigationDestination(
            icon: FaIcon(FontAwesomeIcons.squarePollVertical),
            label: 'Stats',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.blueMediumBlue,
        child: const FaIcon(FontAwesomeIcons.plus),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go(AppRoute.tasks);
        break;
      case 1:
        GoRouter.of(context).go(AppRoute.expenses);
        break;
      case 2:
        GoRouter.of(context).go(AppRoute.calendar);
        break;
      case 3:
        GoRouter.of(context).go(AppRoute.stats);
        break;
    }
  }
}
