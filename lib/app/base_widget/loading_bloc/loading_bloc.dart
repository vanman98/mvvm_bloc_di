import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temp_package_name/app/di.dart';
part 'loading_event.dart';
part 'loading_state.dart';

setLoading(bool loading) {
  return findInstance<LoadingBloc>().add(SetLoading(loading));
}

class LoadingBloc extends Bloc<LoadingEvent, LoadingState> {
  LoadingBloc() : super(LoadingInitial()) {
    on<LoadingEvent>((event, emit) {});
    on<SetLoading>((event, emit) {
      emit(IsLoading(event.loading));
    });
  }
}
