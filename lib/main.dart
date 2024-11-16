import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixster/dependency%20injection/di.dart';
import 'package:pixster/features/Home/presentation/cubit/home_cubit.dart';
import 'package:pixster/features/Home/presentation/navigation.dart';
import 'package:pixster/features/categories/presentation/cubit/categories_cubit.dart';
import 'package:pixster/features/explore/presentation/cubit/explore_cubit.dart';
import 'package:pixster/features/favorites/presentation/cubit/favorites_cubit.dart';
import 'package:pixster/features/hive_db/domain/constants.dart';
import 'package:pixster/theme/dark_mode.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'features/hive_db/domain/photos.dart';

void main() async {
  //dependency injection
  setup();

  //init hive
  await Hive.initFlutter();
  //register adapter
  Hive.registerAdapter(PhotosAdapter());

  //open a box
  boxPhotos = await Hive.openBox<Photos>("favoriteWallpapers");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //multi bloc provider
    return MultiBlocProvider(
      providers: [
        //Home cubit
        BlocProvider(
          create: (context) => getIt<HomeCubit>(),
        ),

        //Explore cubit
        BlocProvider(
          create: (context) => getIt<ExploreCubit>(),
        ),

        //Category cubit
        BlocProvider(
          create: (context) => getIt<CategoriesCubit>(),
        ),

        //Favorites cubit
        BlocProvider(
          create: (context) => getIt<FavoritesCubit>(),
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
