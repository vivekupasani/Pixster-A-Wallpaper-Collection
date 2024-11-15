part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

//states of home
final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  final List<PhotoModel>? photos;

  HomeLoaded({required this.photos});
}

final class HomeError extends HomeState {
  final String message;

  HomeError({required this.message});
}
