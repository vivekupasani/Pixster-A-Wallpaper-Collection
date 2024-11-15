import 'package:pixster/features/hive_db/domain/constants.dart';
import 'package:pixster/features/hive_db/domain/hive_repo.dart';
import 'package:pixster/features/hive_db/domain/photos.dart';

class HiveDbRepo implements HiveRepo {
  //Add wallpaper to favorite
  @override
  Future<void> addToFavorite(Photos wallpaper, [onCallBack]) async {
    await boxPhotos.put(
      wallpaper.id,
      Photos(
        id: wallpaper.id,
        width: wallpaper.width,
        height: wallpaper.height,
        url: wallpaper.url,
        photographer: wallpaper.photographer,
        photographerUrl: wallpaper.photographerUrl,
        photographerId: wallpaper.photographerId,
        avgColor: wallpaper.avgColor,
        src: wallpaper.src,
        liked: wallpaper.liked,
        alt: wallpaper.alt,
      ),
    );
  }

  //Delete wallpaper from favorites
  @override
  Future<void> deleteToFavorite(Photos wallpaper) async {
    await boxPhotos.delete(wallpaper.id);
  }

  //Display wallpapers from favorites
  @override
  Future<List<Photos>> displayFavorite() async {
    return boxPhotos.values.toList().cast<Photos>();
  }
}
