import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_leaning_app/pages/auth/register/bloc/register_event.dart';
import 'package:tech_leaning_app/pages/auth/register/bloc/register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterState()) {
    on<UserameEvent>(_usernameEvent);

    on<EmailEvent>(_emailEvent);

    on<PasswordEvent>(_passwordEvent);

    on<RePasswordEvent>(_rePasswordEvent);
  }

  void _usernameEvent(UserameEvent event, Emitter<RegisterState> emitter) {
    emitter(state.copyWith(username: event.username));
  }

  void _emailEvent(EmailEvent emailEvent, Emitter<RegisterState> emitter) {
    emitter(state.copyWith(email: emailEvent.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<RegisterState> emitter) {
    emitter(state.copyWith(password: event.password));
  }

  void _rePasswordEvent(RePasswordEvent event, Emitter<RegisterState> emitter) {
    emitter(state.copyWith(rePassword: event.rePassword));
  }
}
