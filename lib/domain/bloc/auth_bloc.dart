import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productive/domain/bloc/base_bloc.dart';
import 'package:productive/domain/event/auth_event.dart';
import 'package:productive/domain/state/auth_state.dart';

class AuthBloc extends BaseBloc<AuthEvent, AuthState> {
  AuthBloc() : super(InitialAuthState()) {
    on<LoginAuthEvent>(_handleAuthLogin);
  }

  Future<void> _handleAuthLogin(
    LoginAuthEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(LoadingAuthState());
    try {
      // final user = await _authRepository.login(
      //   username: event.username,
      //   password: event.password,
      // );
    } on Object catch (_) {
      emit(FailedAuthState());
    }
  }
}
