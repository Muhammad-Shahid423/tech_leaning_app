import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_leaning_app/application/app_bloc.dart';
import 'package:tech_leaning_app/application/app_event.dart';
import 'package:tech_leaning_app/common/routes/routes.dart';
import 'package:tech_leaning_app/common/values/constants.dart';
import 'package:tech_leaning_app/global.dart';
import 'package:tech_leaning_app/pages/profile/settings/bloc/settings_bloc.dart';
import 'package:tech_leaning_app/pages/profile/settings/widgets/settings_widgets.dart';

import 'bloc/settings_state.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  void removeUserData() {
    context.read<AppBloc>().add(const TriggerAppEvent(0));
    Global.storageService.removeValue(AppConstants.STORAGE_USER_PROFILE_KEY);
    Global.storageService.removeValue(AppConstants.STORAGE_USER_TOKEN_KEY);
    Global.storageService.removeValue(AppConstants.IS_LOGGED_IN);
    Navigator.of(context)
        .pushNamedAndRemoveUntil(AppRoutes.login, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: settingsAppBar(),
      body:
          SingleChildScrollView(child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return Container(
            child: Column(
              children: [logoutButton(context, removeUserData)],
            ),
          );
        },
      )),
    );
  }
}
