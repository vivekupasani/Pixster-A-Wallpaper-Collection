import 'package:pixster/features/Home/domain/photo.dart';

abstract class ExploreRepo {
  Future<List<PhotoModel>?> getPopularWallpapers(String query);
}
