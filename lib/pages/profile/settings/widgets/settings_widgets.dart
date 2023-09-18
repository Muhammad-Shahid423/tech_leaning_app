import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_leaning_app/common/widgets/base_text_widget.dart';

AppBar settingsAppBar() {
  return AppBar(
    centerTitle: true,
    title: reuseText("Settings"),
  );
}

Widget logoutButton(BuildContext context, void Function() func) {
  return GestureDetector(
    onTap: () {
      showDialog(
          context: context,
          builder: ((context) {
            return AlertDialog(
              title: const Text("Confirm logout"),
              content: const Text("Confirm logout"),
              backgroundColor: Colors.white,
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Cancel"),
                ),
                TextButton(
                  onPressed: () {
                    func();
                  },
                  child: const Text("Confirm"),
                )
              ],
            );
          }));
    },
    child: Container(
      height: 100.h,
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: AssetImage("assets/icons/Logout.png"))),
    ),
  );
}
