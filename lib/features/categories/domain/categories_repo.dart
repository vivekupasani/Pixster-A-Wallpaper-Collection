import 'package:pixster/features/Home/domain/photo.dart';

abstract class CategoriesRepo {
  Future<List<PhotoModel>?> getPerticularCategoryWallpapers(String query);
}
