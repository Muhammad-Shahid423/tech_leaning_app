import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tech_leaning_app/common/entities/user.dart';
import 'package:tech_leaning_app/common/widgets/flutter_toast.dart';
import 'package:tech_leaning_app/pages/auth/login/bloc/login_bloc.dart';

import '../../../common/api/user_api.dart';
import '../../../common/routes/routes.dart';
import '../../../common/values/constants.dart';
import '../../../global.dart';
import '../../../main.dart';

class LoginController {
  final BuildContext context;

  const LoginController({required this.context});

  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        final state = context.read<LoginBloc>().state;
        String emailAddress = state.email;
        String password = state.password;

        if (emailAddress.isEmpty) {
          toastInfo(msg: "You need to fill email address");
          return;
        }
        if (password.isEmpty) {
          toastInfo(msg: "You need to fill password");
          return;
        }
        try {
          print("Email is $emailAddress");
          final credential = await auth.signInWithEmailAndPassword(
              email: emailAddress, password: password);

          if (credential.user == null) {
            toastInfo(msg: "User does not exist");
            return;
          }

          if (!(credential.user!.emailVerified)) {
            toastInfo(msg: "You need to verify your email address");
            return;
          }

          var user = credential.user;
          if (user != null) {
            String? displayName = user.displayName;
            String? email = user.email;
            String? uid = user.uid;
            String? photoURL = user.photoURL;

            LoginRequestEntity loginRequestEntity = LoginRequestEntity();
            loginRequestEntity.avatar = photoURL;
            loginRequestEntity.name = displayName;
            loginRequestEntity.email = email;
            loginRequestEntity.open_id = uid;
            loginRequestEntity.type = 1;

            asyncPostAllData(loginRequestEntity);
          } else {
            toastInfo(msg: "Currently you are not a user of this app");
            return;
          }
        } on FirebaseAuthException catch (exception) {
          print(exception);
          if (exception.code == 'user-not-found') {
            toastInfo(msg: "No user found for that email.");
          } else if (exception.code == 'wrong-password') {
            toastInfo(msg: 'Wrong password provided for that user.');
          } else if (exception.code == 'invalid-email') {
            toastInfo(msg: 'Your email format is wrong.');
          }
        }
      }
    } catch (e) {
      print("Exception");
    }
  }

  void asyncPostAllData(LoginRequestEntity loginRequestEntity) async {
    EasyLoading.show(
        indicator: const CircularProgressIndicator(),
        maskType: EasyLoadingMaskType.clear,
        dismissOnTap: true);

    var result = await UserApi.login(params: loginRequestEntity);

    if (result.code == 200) {
      try {
        toastInfo(msg: "Login Successfully.");

        // navigate to new page
        Global.storageService.setString(
            AppConstants.STORAGE_USER_PROFILE_KEY, jsonEncode(result.data!));
        Global.storageService.setString(
            AppConstants.STORAGE_USER_TOKEN_KEY, result.data!.access_token!);
        Global.storageService.setBool(AppConstants.IS_LOGGED_IN, true);
        EasyLoading.dismiss();
        Navigator.of(context)
            .pushNamedAndRemoveUntil(AppRoutes.bottomNavBar, (route) => false);
      } catch (e) {}
    } else {
      EasyLoading.dismiss();
      toastInfo(msg: "Unknown error");
    }
  }
}
