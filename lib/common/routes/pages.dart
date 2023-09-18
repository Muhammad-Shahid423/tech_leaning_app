import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_leaning_app/application/app_bloc.dart';
import 'package:tech_leaning_app/common/routes/routes.dart';
import 'package:tech_leaning_app/global.dart';
import 'package:tech_leaning_app/pages/auth/login/bloc/login_bloc.dart';
import 'package:tech_leaning_app/pages/auth/login/login_screen.dart';
import 'package:tech_leaning_app/pages/auth/register/register.dart';
import 'package:tech_leaning_app/pages/home/bloc/home_bloc.dart';
import 'package:tech_leaning_app/pages/home/home_screen.dart';
import 'package:tech_leaning_app/pages/profile/settings/bloc/settings_bloc.dart';
import 'package:tech_leaning_app/pages/profile/settings/settings.dart';
import 'package:tech_leaning_app/pages/welcome/welcome.dart';

import '../../pages/auth/register/bloc/register_bloc.dart';
import '../../pages/welcome/bloc/welcome_bloc.dart';
import '../../pages/home/widgets/bottom_nav_bar.dart';

//unify bloc providers and routes and pages

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
        route: AppRoutes.initial,
        page: const WelcomeScreen(),
        bloc: BlocProvider(create: (_) => WelcomeBloc()),
      ),
      PageEntity(
        route: AppRoutes.bottomNavBar,
        page: const BottomNavBar(),
        bloc: BlocProvider(create: (_) => AppBloc()),
      ),
      PageEntity(
        route: AppRoutes.login,
        page: const LoginScreen(),
        bloc: BlocProvider(create: (_) => LoginBloc()),
      ),
      PageEntity(
        route: AppRoutes.register,
        page: const RegisterScreen(),
        bloc: BlocProvider(create: (_) => RegisterBloc()),
      ),
      PageEntity(
        route: AppRoutes.home,
        page: const HomeScreen(),
        bloc: BlocProvider(create: (_) => HomeScreenBloc()),
      ),
      PageEntity(
        route: AppRoutes.settings,
        page: const SettingsScreen(),
        bloc: BlocProvider(create: (_) => SettingsBloc()),
      )
    ];
  }

  //return all the bloc providers
  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];

    for (var localBloc in routes()) {
      blocProviders.add(localBloc.bloc);
    }

    return blocProviders;
  }

  // a model that covers entire screen as we click on navigator object
  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      var result = routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
        if (result.first.route == AppRoutes.initial && deviceFirstOpen) {
          bool isLoggedIn = Global.storageService.isLoggedIn();
          if (isLoggedIn) {
            return MaterialPageRoute(
                builder: (_) => const BottomNavBar(), settings: settings);
          } else {
            return MaterialPageRoute(
                builder: (_) => const LoginScreen(), settings: settings);
          }
        }
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }

    return MaterialPageRoute(
        builder: (_) => const LoginScreen(), settings: settings);
  }
}

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page, this.bloc});
}
