import 'package:pixster/features/Home/domain/photo.dart';

abstract class PixabyRepo {
  Future<List<PhotoModel>?> getTrendingImages();
}
