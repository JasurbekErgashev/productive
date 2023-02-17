import 'package:flutter/material.dart';
import 'package:productive/app/navigation/app_route_factory.dart';
import 'package:productive/theme.dart';

class Productive extends StatelessWidget {
  const Productive({required this.isFirstLaunched, super.key});
  final bool isFirstLaunched;
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      title: 'Productive',
      theme: ProductiveTheme.theme(),
      // TODO: We have not implemented isFirstLauched yet
    );
  }
}
