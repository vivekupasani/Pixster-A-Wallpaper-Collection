import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pixster/features/Home/domain/photo.dart';
import 'package:pixster/features/Home/domain/pixaby_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  PixabyRepo pixabyRepo;
  HomeCubit(this.pixabyRepo) : super(HomeInitial());

  //function to get trending wallpapers
  Future<void> getTrendingImages() async {
    //try to fetch wallpapers
    try {
      //emit loading state while fetching
      emit(HomeLoading());

      //get the wallpapers
      List<PhotoModel>? photos = await pixabyRepo.getTrendingImages();

      //emit the loaded state with list of hits
      emit(HomeLoaded(photos: photos));

      //throw message if there is any error
    } catch (e) {
      emit(HomeError(message: e.toString()));
    }
  }
}
