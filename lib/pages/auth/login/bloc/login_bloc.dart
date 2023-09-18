import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_leaning_app/pages/auth/login/bloc/login_event.dart';
import 'package:tech_leaning_app/pages/auth/login/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<EmailEvent>(_emailEvent);

    on<PasswordEvent>(_passwordEvent);
  }

  void _emailEvent(EmailEvent emailEvent, Emitter<LoginState> emitter) {
    emitter(state.copyWith(email: emailEvent.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<LoginState> emitter) {
    emitter(state.copyWith(password: event.password));
  }
}
