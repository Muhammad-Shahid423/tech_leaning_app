abstract class HomeScreenEvent {
  const HomeScreenEvent();
}

class HomeScreenDots extends HomeScreenEvent {
  final int index;
  HomeScreenDots(this.index);
}
