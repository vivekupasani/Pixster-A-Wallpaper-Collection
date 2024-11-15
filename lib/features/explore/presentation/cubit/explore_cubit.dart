import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pixster/features/Home/domain/photo.dart';
import 'package:pixster/features/explore/domain/explore_repo.dart';

part 'explore_state.dart';

class ExploreCubit extends Cubit<ExploreState> {
  final ExploreRepo exploreRepo;

  ExploreCubit(this.exploreRepo) : super(ExploreInitial());

  // Method to get popular wallpapers
  Future<void> getPopularWallpapers(String query) async {
    try {
      // Emit loading state
      emit(ExploreLoading());

      // Await the fetching of wallpapers and handle the result
      List<PhotoModel>? photos = await exploreRepo.getPopularWallpapers(query);

      // Emit loaded state with photos
      emit(ExploreLoaded(photos: photos ?? []));
    } catch (e) {
      // Emit error state
      emit(ExploreError(message: e.toString()));
    }
  }
}
