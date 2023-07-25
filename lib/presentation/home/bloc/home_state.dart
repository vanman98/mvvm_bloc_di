// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class ColorTextState extends HomeState {
  final Color color;
  const ColorTextState({
    required this.color,
  });
  @override
  List<Object> get props => [color];
}

class ColorBackgroundButton extends HomeState {
  final Color colorBackground;
  const ColorBackgroundButton({
    required this.colorBackground,
  });
  @override
  List<Object> get props => [colorBackground];
}