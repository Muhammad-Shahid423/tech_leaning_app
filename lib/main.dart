import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_leaning_app/common/routes/pages.dart';
import 'package:tech_leaning_app/common/routes/routes.dart';
import 'package:tech_leaning_app/common/values/colors.dart';
import 'package:tech_leaning_app/global.dart';
import 'package:firebase_core/firebase_core.dart';

bool shouldUseFirebaseEmulator = false;
late final FirebaseApp app;
late final FirebaseAuth auth;

Future<void> main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPages.allBlocProviders(context)],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => MaterialApp(
          builder: EasyLoading.init(),
          debugShowCheckedModeBanner: false,
          title: 'Tech Learning App',
          theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
              appBarTheme: const AppBarTheme(
                  iconTheme: IconThemeData(color: AppColors.primaryText),
                  elevation: 0,
                  backgroundColor: Colors.white)),
          initialRoute: AppRoutes.initial,
          onGenerateRoute: AppPages.GenerateRouteSettings,
          // home: const WelcomeScreen(),
          // routes: {
          //   "home": (context) => const HomeScreen(),
          //   "login": (context) => const LoginScreen(),
          //   "register": (context) => const RegisterScreen(),
          // },
        ),
      ),
    );
  }
}
