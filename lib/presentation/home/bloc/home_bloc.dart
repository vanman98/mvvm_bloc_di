import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<ChangeColorText>((event, emit) {
      emit(const ColorTextState(color: Colors.red));
    });
    on<ChangeColorBackgroundButton>((event, emit) {
      emit(const ColorBackgroundButton(colorBackground: Colors.green));
    });
  }
}
