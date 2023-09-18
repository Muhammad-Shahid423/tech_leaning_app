import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_leaning_app/pages/profile/settings/bloc/settings_event.dart';
import 'package:tech_leaning_app/pages/profile/settings/bloc/settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(const SettingsState()) {
    on<TriggerSettings>(_triggerSettings);
  }

  _triggerSettings(SettingsEvent event, Emitter emitter) {
    emitter(const SettingsState());
  }
}
