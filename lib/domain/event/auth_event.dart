import 'package:equatable/equatable.dart';
import 'package:productive/domain/event/base_event.dart';

abstract class AuthEvent extends BaseEvent with EquatableMixin {
  @override
  List<Object> get props => [];
}

class LoginAuthEvent extends AuthEvent {
  LoginAuthEvent({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object> get props => [...super.props, email, password];
}

class RegisterAuthEvent extends AuthEvent {
  RegisterAuthEvent({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object> get props => [...super.props, email, password];
}
