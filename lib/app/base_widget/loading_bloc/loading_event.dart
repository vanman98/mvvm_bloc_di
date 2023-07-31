// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'loading_bloc.dart';

abstract class LoadingEvent extends Equatable {
  const LoadingEvent();

  @override
  List<Object> get props => [];
}

class SetLoading extends LoadingEvent {
  final bool loading;
  const SetLoading(
    this.loading,
  );
}
