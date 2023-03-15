import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productive/app/navigation/app_route_factory.dart';
import 'package:productive/domain/bloc/auth_bloc.dart';
import 'package:productive/theme.dart';

class Productive extends StatelessWidget {
  const Productive({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: appRouter,
        debugShowCheckedModeBanner: false,
        title: 'Productive',
        theme: ProductiveTheme.theme(),
      ),
    );
  }
}
