import 'package:flutter/material.dart';
import 'package:tech_leaning_app/common/entities/user.dart';
import 'package:tech_leaning_app/global.dart';

class HomeController {
  final BuildContext context;
  HomeController({required this.context});

  UserItem? userProfile = Global.storageService.getUserProfile();

  void init() {}
}
