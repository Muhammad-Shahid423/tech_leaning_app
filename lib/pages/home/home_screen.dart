import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_leaning_app/common/values/colors.dart';
import 'package:tech_leaning_app/pages/home/bloc/home_bloc.dart';
import 'package:tech_leaning_app/pages/home/hom_controller.dart';

import 'widgets/home_screen_widgets.dart';
import 'bloc/home_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeController _homeController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _homeController = HomeController(context: context);
    _homeController.init();
  }

  @override
  Widget build(BuildContext context) {
    return _homeController.userProfile != null
        ? Scaffold(
            backgroundColor: Colors.white,
            appBar:
                buildHomeAppBar(_homeController.userProfile!.avatar.toString()),
            body: BlocBuilder<HomeScreenBloc, HomeScreenState>(
              builder: (context, state) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25.w),
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: reUseHomeText("Home",
                            color: AppColors.primaryThreeElementText, top: 20),
                      ),
                      SliverToBoxAdapter(
                          child: reUseHomeText(
                              _homeController.userProfile!.name!,
                              color: AppColors.primaryText,
                              top: 3)),
                      SliverPadding(
                        padding: EdgeInsets.only(top: 15.h),
                      ),
                      SliverToBoxAdapter(
                        child: homeSearchView(),
                      ),
                      SliverToBoxAdapter(
                        child: homeSlider(context, state),
                      ),
                      SliverToBoxAdapter(
                        child: homeMenuView(),
                      ),
                      SliverPadding(
                        padding: EdgeInsets.symmetric(
                            vertical: 18.h, horizontal: 0.w),
                        sliver: SliverGrid(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 15,
                                  crossAxisSpacing: 15,
                                  childAspectRatio: 1.6),
                          delegate: SliverChildBuilderDelegate(childCount: 4,
                              (context, index) {
                            return GestureDetector(
                              onTap: () {},
                              child: courseGridView(),
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        : Container();
  }
}
