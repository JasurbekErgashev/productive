import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:productive/app/ui/screens/home/calendar/calendar_page.dart';
import 'package:productive/app/ui/screens/home/expenses/expense_page.dart';
import 'package:productive/app/ui/screens/home/stats/stats_page.dart';
import 'package:productive/app/ui/screens/home/tasks/all.dart';
import 'package:productive/app/ui/screens/home/tasks/upcoming.dart';
import 'package:productive/app/ui/screens/home/tasks/widgets/side_nav_bar_drawer.dart';
import 'package:productive/theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late TabController _tabController;
  int _bottomBarIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  TabBar get _tabBar => TabBar(
        controller: _tabController,
        dividerColor: AppColors.transparent,
        tabs: const [
          Tab(text: 'Upcoming'),
          Tab(text: 'All'),
        ],
      );

  List<Widget> pages = const [
    Placeholder(), // Ignore placeholder, we will keep tasks screen
    // in the body since tabController is here
    ExpensesPage(),
    CalendarPage(),
    StatsPage(),
  ];

  List<String> appBarTitle = const [
    '',
    'Expenses',
    'Calendar',
    'Stats',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: Text(appBarTitle[_bottomBarIndex]),
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: _bottomBarIndex == 0
            ? IconButton(
                onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                icon: const FaIcon(FontAwesomeIcons.bars),
              )
            : null,
        actions: _bottomBarIndex == 0
            ? [
                IconButton(
                  onPressed: () => context.go('/quickNotes'),
                  icon: const FaIcon(FontAwesomeIcons.noteSticky),
                ),
                IconButton(
                  onPressed: () => context.go('/notifications'),
                  icon: const Badge(
                    label: Text('2'),
                    child: FaIcon(FontAwesomeIcons.bell),
                  ),
                ),
              ]
            : _bottomBarIndex == 1
                ? [
                    IconButton(
                      onPressed: () {},
                      icon: const FaIcon(FontAwesomeIcons.gear),
                    ),
                  ]
                : [],
        bottom: _bottomBarIndex == 0
            ? PreferredSize(
                preferredSize: _tabBar.preferredSize,
                child: _tabBar,
              )
            : null,
      ),
      body: _bottomBarIndex == 0
          ? Padding(
              padding: const EdgeInsets.all(16),
              child: TabBarView(
                controller: _tabController,
                children: const [
                  UpcomingTasks(),
                  AllTasks(),
                ],
              ),
            )
          : pages[_bottomBarIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() => _bottomBarIndex = index);
        },
        selectedIndex: _bottomBarIndex,
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
}
