import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_leaning_app/pages/auth/register/register_controller.dart';

import '../../../common/widgets/common_widgets.dart';
import 'bloc/register_bloc.dart';
import 'bloc/register_event.dart';
import 'bloc/register_state.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar("Sign Up"),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Center(
                  child: reUseableTexts(
                      "Enter your details below and free sign up")),
              Container(
                margin: EdgeInsets.only(top: 60.h),
                padding: EdgeInsets.only(left: 25.w, right: 25.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    reUseableTexts("User name"),
                    SizedBox(
                      height: 3.h,
                    ),
                    reUseableTextField("Enter your user name", "username",
                        "assets/icons/user.png", (value) {
                      context.read<RegisterBloc>().add(UserameEvent(value));
                    }),
                    reUseableTexts("Email"),
                    SizedBox(
                      height: 3.h,
                    ),
                    reUseableTextField("Enter your email address", "email",
                        "assets/icons/user.png", (value) {
                      print("my email is $value");
                      context.read<RegisterBloc>().add(EmailEvent(value));
                    }),
                    reUseableTexts("Password"),
                    SizedBox(
                      height: 3.h,
                    ),
                    reUseableTextField("Enter your password", "password",
                        "assets/icons/lock.png", (value) {
                      context.read<RegisterBloc>().add(PasswordEvent(value));
                    }),
                    reUseableTexts("Re-enter your Password"),
                    SizedBox(
                      height: 3.h,
                    ),
                    reUseableTextField("Re-enter your password to confirm",
                        "password", "assets/icons/lock.png", (value) {
                      context.read<RegisterBloc>().add(RePasswordEvent(value));
                    }),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(left: 25.w),
                  child: reUseableTexts(
                      "By creating an account you have to agree with our terms & conditions.")),
              SizedBox(
                height: 10.h,
              ),
              loginRegButton("Sign up", "login", () {
                RegisterController(context: context).handleSignUp();
              }),
            ],
          ),
        ),
      );
    });
  }
}
