import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:pixster/features/Home/data/pixaby_api_repo.dart';
import 'package:pixster/features/Home/presentation/cubit/home_cubit.dart';
import 'package:pixster/features/categories/data/categories_api_repo.dart';
import 'package:pixster/features/categories/presentation/cubit/categories_cubit.dart';
import 'package:pixster/features/explore/data/explore_api_repo.dart';
import 'package:pixster/features/explore/presentation/cubit/explore_cubit.dart';
import 'package:pixster/features/favorites/presentation/cubit/favorites_cubit.dart';
import 'package:pixster/features/hive_db/data/hive_db_repo.dart';

final getIt = GetIt.instance;

void setup() {
  /*--------------------------------------
  repository instance dependency injaction
  --------------------------------------*/

  //Home Api Repo
  getIt.registerSingleton<PixabyApiRepo>(PixabyApiRepo(client: Client()));

  //Explore Api Repo
  getIt.registerSingleton<ExploreApiRepo>(ExploreApiRepo());

  //Category Api Repo
  getIt.registerSingleton<CategoriesApiRepo>(CategoriesApiRepo());

  //Hive Db Repo
  getIt.registerSingleton<HiveDbRepo>(HiveDbRepo());

  /*----------------------------------
  cubit instance dependency injaction
  -----------------------------------*/

  //Home Cubit
  getIt.registerSingleton<HomeCubit>(HomeCubit(getIt<PixabyApiRepo>()));

  //Favorites Cubit
  getIt.registerSingleton<FavoritesCubit>(
      FavoritesCubit(hiveRepo: getIt<HiveDbRepo>()));

  //Explore Cubit
  getIt.registerSingleton<ExploreCubit>(ExploreCubit(getIt<ExploreApiRepo>()));

  //Categories Cubit
  getIt.registerSingleton<CategoriesCubit>(
      CategoriesCubit(getIt<CategoriesApiRepo>()));
}
