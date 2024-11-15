import 'package:pixster/features/hive_db/domain/photos.dart';

abstract class HiveRepo {
  Future<void> addToFavorite(Photos wallapaper);
Future<List<Photos>> displayFavorite();
  Future<void> deleteToFavorite(Photos wallapaper);
}
