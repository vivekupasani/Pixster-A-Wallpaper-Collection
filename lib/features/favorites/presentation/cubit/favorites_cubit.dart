import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pixster/features/hive_db/domain/photos.dart';
import 'package:pixster/features/hive_db/domain/hive_repo.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final HiveRepo hiveRepo;

  FavoritesCubit({required this.hiveRepo}) : super(FavoritesInitial());

  // Cubit method to add a wallpaper to favorites
  Future<void> addToFavorites(Photos wallpaper) async {
    try {
      emit(FavoritesLoading());
      await hiveRepo.addToFavorite(wallpaper);

      // Refresh the list after adding
      await displayFavorites();

      //catch if there is any error
    } catch (e) {
      emit(FavoritesError(message: 'Failed to add to favorites: $e'));
    }
  }

  // Cubit method to display all favorite wallpapers
  Future<void> displayFavorites() async {
    try {
      emit(FavoritesLoading());
      final photos = await hiveRepo.displayFavorite();

      emit(FavoritesLoaded(photos: photos));

      //catch if there is any error
    } catch (e) {
      emit(FavoritesError(message: 'Failed to load favorites: $e'));
    }
  }

  // Cubit method to delete a wallpaper from favorites
  Future<void> deleteFromFavorites(Photos wallpaper) async {
    try {
      emit(FavoritesLoading());
      await hiveRepo.deleteToFavorite(wallpaper);

      // Refresh the list after deletion
      await displayFavorites();

      //catch if there is any error
    } catch (e) {
      emit(FavoritesError(message: 'Failed to delete from favorites: $e'));
    }
  }
}
