part of 'nav_bar_cubit.dart';

class NavBarState extends Equatable {
  final int currentIndex;
  const NavBarState({this.currentIndex = 0});

  NavBarState copyWith({
    int? currentIndex
  }) => NavBarState(
    currentIndex: currentIndex ?? this.currentIndex
  );

  @override
  List<Object?> get props => [currentIndex];
}


