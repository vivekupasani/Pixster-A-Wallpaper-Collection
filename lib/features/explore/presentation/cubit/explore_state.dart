part of 'explore_cubit.dart';

@immutable
sealed class ExploreState {}

final class ExploreInitial extends ExploreState {}

//states of explore
final class ExploreLoading extends ExploreState {}

final class ExploreLoaded extends ExploreState {
  final List<PhotoModel> photos;

  ExploreLoaded({required this.photos});
}

final class ExploreError extends ExploreState {
  final String message;

  ExploreError({required this.message});
}
