import 'package:flutter/material.dart';
import 'package:productive/app/navigation/app_route_factory.dart';
import 'package:productive/theme.dart';

class Productive extends StatelessWidget {
  const Productive({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      title: 'Productive',
      theme: ProductiveTheme.theme(),
    );
  }
}
