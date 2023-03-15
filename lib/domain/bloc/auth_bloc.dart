import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productive/data/repositories/auth_repository.dart';
import 'package:productive/domain/bloc/base_bloc.dart';
import 'package:productive/domain/event/auth_event.dart';
import 'package:productive/domain/state/auth_state.dart';

class AuthBloc extends BaseBloc<AuthEvent, AuthState> {
  AuthBloc() : super(InitialAuthState()) {
    on<LoginAuthEvent>(_handleAuthLogin);
    on<RegisterAuthEvent>(_handleAuthRegister);
  }

  final AuthenticationRepository authRepository = AuthenticationRepository();

  Future<void> _handleAuthLogin(
    LoginAuthEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(LoadingAuthState());
    try {
      await authRepository.logInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      emit(SuccessAuthState());
    } on LogInWithEmailAndPasswordFailure catch (e) {
      emit(FailedAuthState(message: e.message));
    } on Object catch (_) {
      emit(FailedAuthState(message: 'Something went wrong'));
    }
  }

  Future<void> _handleAuthRegister(
      RegisterAuthEvent event, Emitter<AuthState> emit) async {
    emit(LoadingAuthState());
    try {
      await authRepository.signUp(
        email: event.email,
        password: event.password,
      );
      emit(SuccessAuthState());
    } on SignUpWithEmailAndPasswordFailure catch (e) {
      emit(FailedAuthState(message: e.message));
    } on Object catch (_) {
      emit(FailedAuthState(message: 'Something went wrong'));
    }
  }
}
