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
  //repository instance
  getIt.registerSingleton<PixabyApiRepo>(PixabyApiRepo(client: Client()));
  getIt.registerSingleton<ExploreApiRepo>(ExploreApiRepo());
  getIt.registerSingleton<CategoriesApiRepo>(CategoriesApiRepo());
  getIt.registerSingleton<HiveDbRepo>(HiveDbRepo());

  //cubit instance
  getIt.registerSingleton<HomeCubit>(HomeCubit(getIt<PixabyApiRepo>()));
  getIt.registerSingleton<FavoritesCubit>(
      FavoritesCubit(hiveRepo: getIt<HiveDbRepo>()));
  getIt.registerSingleton<ExploreCubit>(ExploreCubit(getIt<ExploreApiRepo>()));
  getIt.registerSingleton<CategoriesCubit>(
      CategoriesCubit(getIt<CategoriesApiRepo>()));
}
