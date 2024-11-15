part of 'categories_cubit.dart';

@immutable
sealed class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}

//states of category
final class CategoryLoading extends CategoriesState {}

final class CategoryLoaded extends CategoriesState {
  final List<PhotoModel> photos;

  CategoryLoaded({required this.photos});
}

final class CategoryError extends CategoriesState {
  final String message;

  CategoryError({required this.message});
}
