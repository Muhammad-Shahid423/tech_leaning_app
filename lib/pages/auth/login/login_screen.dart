import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_leaning_app/common/routes/routes.dart';
import 'package:tech_leaning_app/pages/auth/login/bloc/login_bloc.dart';
import 'package:tech_leaning_app/pages/auth/login/bloc/login_event.dart';
import 'package:tech_leaning_app/pages/auth/login/bloc/login_state.dart';
import 'package:tech_leaning_app/pages/auth/login/login_controller.dart';

import '../../../common/widgets/common_widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar("Log In"),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildThirdPartyLogin(context),
              Center(child: reUseableTexts("Or use your email account login")),
              Container(
                margin: EdgeInsets.only(top: 40.h),
                padding: EdgeInsets.only(left: 25.w, right: 25.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    reUseableTexts("Email"),
                    SizedBox(
                      height: 4.h,
                    ),
                    reUseableTextField("Enter your email address", "email",
                        "assets/icons/user.png", (value) {
                      print("my email is $value");
                      context.read<LoginBloc>().add(EmailEvent(value));
                    }),
                    reUseableTexts("Password"),
                    SizedBox(
                      height: 4.h,
                    ),
                    reUseableTextField("Enter your password", "password",
                        "assets/icons/lock.png", (value) {
                      context.read<LoginBloc>().add(PasswordEvent(value));
                    }),
                  ],
                ),
              ),
              forgetPassword(),
              SizedBox(
                height: 70.h,
              ),
              loginRegButton("Log In", "login", () {
                LoginController(context: context).handleSignIn("email");
              }),
              loginRegButton("Sign up", "register", () {
                Navigator.of(context).pushNamed(AppRoutes.register);
              })
            ],
          ),
        ),
      );
    });
  }
}
