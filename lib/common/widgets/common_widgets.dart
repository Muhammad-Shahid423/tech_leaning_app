import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_leaning_app/common/values/colors.dart';
import 'package:tech_leaning_app/pages/home/home_screen.dart';
import 'package:tech_leaning_app/pages/profile/profile_screen.dart';

AppBar buildAppBar(String type) {
  return AppBar(
    backgroundColor: Colors.white,
    bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(
          color: AppColors.primarySecondaryBackground,
          height: 1,
        )),
    title: Text(
      type,
      style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.normal,
          color: AppColors.primaryText),
    ),
    centerTitle: true,
  );
}

Widget buildPage(int index) {
  List<Widget> widget = [
    const HomeScreen(),
    const Center(child: Text("Search")),
    const Center(child: Text("Course")),
    const Center(child: Text("Chat")),
    const ProfileScreen()
  ];

  return widget[index];
}

var bottomTabs = [
  BottomNavigationBarItem(
    label: "Home",
    icon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset("assets/icons/home.png"),
    ),
    activeIcon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset(
        "assets/icons/home.png",
        color: AppColors.primaryElement,
      ),
    ),
  ),
  BottomNavigationBarItem(
    label: "Search",
    icon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset("assets/icons/search.png"),
    ),
    activeIcon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset(
        "assets/icons/search.png",
        color: AppColors.primaryElement,
      ),
    ),
  ),
  BottomNavigationBarItem(
    label: "Course",
    icon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset("assets/icons/play-circle1.png"),
    ),
    activeIcon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset(
        "assets/icons/play-circle1.png",
        color: AppColors.primaryElement,
      ),
    ),
  ),
  BottomNavigationBarItem(
    label: "Chat",
    icon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset("assets/icons/message-circle.png"),
    ),
    activeIcon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset(
        "assets/icons/message-circle.png",
        color: AppColors.primaryElement,
      ),
    ),
  ),
  BottomNavigationBarItem(
    label: "Profile",
    icon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset("assets/icons/person2.png"),
    ),
    activeIcon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset(
        "assets/icons/person2.png",
        color: AppColors.primaryElement,
      ),
    ),
  ),
];

Widget buildThirdPartyLogin(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(top: 40.h, bottom: 20.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        reUseableIcons("assets/icons/google.png"),
        SizedBox(width: 20.w),
        reUseableIcons("assets/icons/apple.png"),
        SizedBox(width: 20.w),
        reUseableIcons("assets/icons/facebook.png"),
      ],
    ),
  );
}

Widget reUseableIcons(String iconName) {
  return GestureDetector(
    onTap: () {},
    child: SizedBox(
      height: 50.w,
      width: 50.w,
      child: Image.asset(iconName),
    ),
  );
}

Widget reUseableTexts(String reText) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    child: Text(
      reText,
      style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
          color: Colors.grey.withOpacity(0.5)),
    ),
  );
}

Widget reUseableTextField(String text, String textType, String iconName,
    void Function(String value) func) {
  return Container(
    width: 325.w,
    height: 50.h,
    margin: EdgeInsets.only(bottom: 15.h),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15.w)),
        border: Border.all(color: AppColors.primaryFourElementText)),
    child: Row(
      children: [
        Container(
          width: 16.w,
          height: 16.h,
          margin: EdgeInsets.only(left: 17.w),
          child: Image.asset(iconName),
        ),
        SizedBox(
          width: 270.w,
          height: 50.h,
          // margin: EdgeInsets.only(left: 17.w),
          child: TextField(
            onChanged: (value) => func(value),
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.fromLTRB(5, 5, 0, 5),
                hintText: text,
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                disabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                hintStyle: const TextStyle(
                    color: AppColors.primarySecondaryElementText)),
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.normal,
                fontFamily: "Avenir",
                color: AppColors.primaryText),
            autocorrect: false,
            obscureText: textType == "password" ? true : false,
          ),
        )
      ],
    ),
  );
}

Widget forgetPassword() {
  return Container(
    margin: EdgeInsets.only(left: 25.w),
    width: 260.w,
    height: 44.h,
    child: GestureDetector(
      onTap: () {},
      child: Text(
        "Forget Password",
        style: TextStyle(
            color: AppColors.primaryText,
            decoration: TextDecoration.underline,
            fontSize: 12.sp,
            decorationColor: AppColors.primaryText),
      ),
    ),
  );
}

Widget loginRegButton(String buttonName, String type, void Function()? func) {
  return GestureDetector(
    onTap: () {
      func!();
    },
    child: Container(
      width: 325.w,
      height: 45.h,
      margin: EdgeInsets.only(
          left: 25.w, right: 25.w, top: type == "login" ? 40.h : 20.h),
      decoration: BoxDecoration(
          color: type == "login"
              ? AppColors.primaryElement
              : AppColors.primaryBackground,
          borderRadius: BorderRadius.all(Radius.circular(15.w)),
          border: Border.all(
              color: type == "login"
                  ? Colors.transparent
                  : AppColors.primaryFourElementText),
          boxShadow: [
            BoxShadow(
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0, 1),
                color: Colors.grey.withOpacity(0.1))
          ]),
      child: Center(
        child: Text(
          buttonName,
          style: TextStyle(
              color: type == "login"
                  ? AppColors.primaryBackground
                  : AppColors.primaryText,
              fontSize: 16.sp,
              fontWeight: FontWeight.normal),
        ),
      ),
    ),
  );
}
