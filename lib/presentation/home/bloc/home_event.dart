part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}
class ChangeColorText extends HomeEvent {
  const ChangeColorText();

  @override
  List<Object> get props => [];
}

class ChangeColorBackgroundButton extends HomeEvent {
  const ChangeColorBackgroundButton();

  @override
  List<Object> get props => [];
}
