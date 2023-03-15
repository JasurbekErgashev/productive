import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:productive/app/navigation/app_route.dart';
import 'package:productive/domain/bloc/auth_bloc.dart';
import 'package:productive/domain/event/auth_event.dart';

class RegisterScreenViewModel {
  RegisterScreenViewModel();

  void register(
    BuildContext context, {
    required String email,
    required String password,
  }) {
    BlocProvider.of<AuthBloc>(context).add(
      RegisterAuthEvent(
        email: email,
        password: password,
      ),
    );
  }

  void navigateToTasks(BuildContext context) => context.go(AppRoute.tasks);
}
