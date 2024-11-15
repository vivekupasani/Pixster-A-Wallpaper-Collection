import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pixster/features/Home/domain/photo.dart';
import 'package:pixster/features/categories/domain/categories_repo.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoriesRepo categoriesRepo;
  CategoriesCubit(this.categoriesRepo) : super(CategoriesInitial());

  // Method to get category wise wallpapers
  Future<void> getPopularWallpapers(String query) async {
    try {
      // Emit loading state
      emit(CategoryLoading());

      // Await the fetching of wallpapers and handle the result
      List<PhotoModel>? photos =
          await categoriesRepo.getPerticularCategoryWallpapers(query);

      // Emit loaded state with photos
      emit(CategoryLoaded(photos: photos ?? []));
    } catch (e) {
      // Emit error state
      emit(CategoryError(message: e.toString()));
    }
  }
}
