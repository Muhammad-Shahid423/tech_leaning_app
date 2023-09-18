class HomeScreenState {
  final int index;
  const HomeScreenState({this.index = 0});

  HomeScreenState copyWith({int? index}) {
    return HomeScreenState(index: index ?? this.index);
  }
}
