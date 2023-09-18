import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_leaning_app/common/values/colors.dart';
import 'package:tech_leaning_app/common/values/constants.dart';
import 'package:tech_leaning_app/global.dart';
import 'package:tech_leaning_app/pages/welcome/bloc/welcome_bloc.dart';
import 'package:tech_leaning_app/pages/welcome/bloc/welcome_event.dart';
import 'package:tech_leaning_app/pages/welcome/bloc/welcome_state.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: BlocBuilder<WelcomeBloc, WelcomeState>(
          builder: (context, state) {
            return Container(
              padding: EdgeInsets.only(top: 34.0.h),
              width: 375.w,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  PageView(
                    controller: _pageController,
                    onPageChanged: (int index) {
                      state.page = index;
                      BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                    },
                    children: [
                      _page(
                          1,
                          context,
                          "Next",
                          "First See Learning",
                          "Forget about a for of paper all knowledge in one learning",
                          "assets/images/reading.png"),
                      _page(
                          2,
                          context,
                          "Next",
                          "Connect With Everyone",
                          "Always keep it touch with your tutor & friend. Let's get connected!",
                          "assets/images/boy.png"),
                      _page(
                          3,
                          context,
                          "Get Started",
                          "Always Faciating Learning",
                          "Anywhere, annytime. The time is at your discretion so study whenever you want.",
                          "assets/images/man.png")
                    ],
                  ),
                  Positioned(
                    bottom: 100.h,
                    child: DotsIndicator(
                      position: state.page,
                      dotsCount: 3,
                      mainAxisAlignment: MainAxisAlignment.center,
                      decorator: const DotsDecorator(
                          color: AppColors.primaryThreeElementText,
                          size: Size.square(8.0),
                          activeSize: Size(18.0, 9.0),
                          activeColor: AppColors.primaryElement,
                          activeShape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)))),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _page(int index, BuildContext context, String buttonName, String title,
      String subTitle, String imagePath) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.w,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        Text(
          title,
          style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.normal,
              color: AppColors.primaryText),
        ),
        Container(
          width: 375.w,
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Text(
            subTitle,
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
                color: AppColors.primarySecondaryElementText),
            textAlign: TextAlign.center,
          ),
        ),
        GestureDetector(
          onTap: () {
            if (index < 3) {
              // animate to next page
              _pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn);
            } else {
              Global.storageService
                  .setBool(AppConstants.STORAGE_DEVICE_OPEN_FIST_TIME, true);
              // navigate to new page
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("/login", (route) => false);
            }
          },
          child: Container(
            width: 325.w,
            height: 50.h,
            margin: EdgeInsets.only(left: 25.w, right: 25.w, top: 100.h),
            decoration: BoxDecoration(
                color: AppColors.primaryElement,
                borderRadius: BorderRadius.circular(15.w),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(0, 1))
                ]),
            child: Center(
              child: Text(
                buttonName,
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.normal,
                    color: AppColors.primaryBackground),
              ),
            ),
          ),
        )
      ],
    );
  }
}
