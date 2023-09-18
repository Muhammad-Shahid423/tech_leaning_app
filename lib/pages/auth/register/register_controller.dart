import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_leaning_app/common/widgets/flutter_toast.dart';
import 'package:tech_leaning_app/main.dart';
import 'package:tech_leaning_app/pages/auth/register/bloc/register_bloc.dart';

class RegisterController {
  final BuildContext context;

  const RegisterController({required this.context});

  Future<void> handleSignUp() async {
    try {
      final state = context.read<RegisterBloc>().state;
      String userName = state.username;
      String emailAddress = state.email;
      String password = state.password;
      String rePassword = state.rePassword;

      if (userName.isEmpty) {
        toastInfo(msg: "You need to fill user ame");
        return;
      }
      if (emailAddress.isEmpty) {
        toastInfo(msg: "You need to fill email address");
        return;
      }
      if (password.isEmpty) {
        toastInfo(msg: "You need to fill password");
        return;
      }
      if (rePassword.isEmpty) {
        toastInfo(msg: "Password does not match");
        return;
      }
      try {
        print("Email is $emailAddress");
        final credential = await auth.createUserWithEmailAndPassword(
            email: emailAddress, password: password);

        var user = credential.user;
        if (user != null) {
          await user.sendEmailVerification();
          await user.updateDisplayName(userName);
          String photoUrl = "uploads/default.png";
          await user.updatePhotoURL(photoUrl);
          toastInfo(
              msg:
                  "An email has sent to your registered email. To activate it please check the email and click on the link");
          Navigator.of(context).pop();
        } else {
          toastInfo(msg: "Currently you are not a user of this app");
          return;
        }
      } on FirebaseAuthException catch (exception) {
        print(exception);
        if (exception.code == 'weak-password') {
          toastInfo(msg: "Password is not strong enough.");
        } else if (exception.code == 'email-already-in-use') {
          toastInfo(msg: 'The email is already in use.');
        } else if (exception.code == 'invalid-email') {
          toastInfo(msg: 'Your email address is invalid.');
        }
      }
    } catch (e) {
      print("Exception");
    }
  }
}
