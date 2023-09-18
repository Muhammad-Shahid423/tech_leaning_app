import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_leaning_app/pages/home/bloc/home_event.dart';
import 'package:tech_leaning_app/pages/home/bloc/home_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(const HomeScreenState()) {
    on<HomeScreenDots>(_homePageDots);
  }

  void _homePageDots(HomeScreenDots event, Emitter<HomeScreenState> emitter) {
    emitter(state.copyWith(index: event.index));
  }
}
