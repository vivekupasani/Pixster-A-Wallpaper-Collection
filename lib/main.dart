import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixster/features/Home/data/pixaby_api_repo.dart';
import 'package:pixster/features/Home/presentation/cubit/home_cubit.dart';
import 'package:pixster/features/Home/presentation/navigation.dart';
import 'package:pixster/features/categories/data/categories_api_repo.dart';
import 'package:pixster/features/categories/presentation/cubit/categories_cubit.dart';
import 'package:pixster/features/explore/data/explore_api_repo.dart';
import 'package:pixster/features/explore/presentation/cubit/explore_cubit.dart';
import 'package:pixster/features/favorites/presentation/cubit/favorites_cubit.dart';
import 'package:pixster/features/hive_db/data/hive_db_repo.dart';
import 'package:pixster/features/hive_db/domain/constants.dart';
import 'package:pixster/theme/dark_mode.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'features/hive_db/domain/photos.dart';

void main() async {
  //init hive
  await Hive.initFlutter();
  //register adapter
  Hive.registerAdapter(PhotosAdapter());

  //open a box
  boxPhotos = await Hive.openBox<Photos>("favoriteWallpapers");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  //instance of repositories
  final PixabyApiRepo pixabyRepo = PixabyApiRepo();
  final ExploreApiRepo exploreRepo = ExploreApiRepo();
  final CategoriesApiRepo categoriesRepo = CategoriesApiRepo();
  final HiveDbRepo hiveRepo = HiveDbRepo();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //multi bloc provider
    return MultiBlocProvider(
      providers: [
        //Home cubit
        BlocProvider(
          create: (context) => HomeCubit(pixabyRepo),
        ),

        //Explore cubit
        BlocProvider(
          create: (context) => ExploreCubit(exploreRepo),
        ),

        //Category cubit
        BlocProvider(
          create: (context) => CategoriesCubit(categoriesRepo),
        ),

        //Favorites cubit
        BlocProvider(
          create: (context) => FavoritesCubit(hiveRepo: hiveRepo),
        )
      ],
      child: MaterialApp(
        title: 'V A S U D E V  T E C N O L O G Y',
        debugShowCheckedModeBanner: false,
        theme: darkMode,
        home: const Navigation(),
      ),
    );
  }
}
