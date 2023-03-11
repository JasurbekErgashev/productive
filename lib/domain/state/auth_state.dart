import 'package:equatable/equatable.dart';
import 'package:productive/domain/state/base_state.dart';

abstract class AuthState extends BaseState with EquatableMixin {
  @override
  List<Object> get props => [];
}

class InitialAuthState extends AuthState {}

class LoadingAuthState extends AuthState {}

class InvalidCredAuthState extends AuthState {
  InvalidCredAuthState({required this.message});
  final String message;
  @override
  List<Object> get props => [...super.props, message];
}

class FailedAuthState extends AuthState {}

class SuccessAuthState extends AuthState {}
