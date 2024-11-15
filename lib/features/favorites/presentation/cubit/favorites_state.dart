part of 'favorites_cubit.dart';

@immutable
sealed class FavoritesState {}

final class FavoritesInitial extends FavoritesState {}

//STATES OF FAVORITES
final class FavoritesLoading extends FavoritesState {}

final class FavoritesLoaded extends FavoritesState {
  final List<Photos> photos;

  FavoritesLoaded({required this.photos});
}

final class FavoritesError extends FavoritesState {
  final String message;

  FavoritesError({required this.message});
}
