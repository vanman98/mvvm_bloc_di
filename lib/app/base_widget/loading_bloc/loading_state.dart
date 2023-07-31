// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'loading_bloc.dart';

abstract class LoadingState extends Equatable {
  const LoadingState();

  @override
  List<Object> get props => [];
}

class LoadingInitial extends LoadingState {}

class IsLoading extends LoadingState {
  final bool isLoading;
  const IsLoading(
    this.isLoading,
  );
  @override
  List<Object> get props => [isLoading];
}
