import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixster/features/favorites/presentation/components/show_favorites_bottomsheet.dart';
import 'package:pixster/features/favorites/presentation/cubit/favorites_cubit.dart';
import 'package:pixster/features/hive_db/domain/photos.dart';
import 'package:pixster/responsive/scafold_responsive.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  void initState() {
    super.initState();

    final FavoritesCubit favoritesCubit = context.read<FavoritesCubit>();

    favoritesCubit.displayFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return ScafoldResponsive(
      appBar: AppBar(
        title: const Text("F A V O R I T E S"),
        centerTitle: true,
      ),
      body: BlocConsumer<FavoritesCubit, FavoritesState>(
        //BUILD UI
        builder: (context, state) {
          //State is loading
          if (state is FavoritesLoading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          //State is Loaded
          else if (state is FavoritesLoaded) {
            if (state.photos.isEmpty) {
              return Scaffold(
                body: Center(
                  child: Text(
                    "E M P T Y  F A V O R I T E S  L I S T",
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              );
            } else {
              return _buildExplorePage(
                context,
                state.photos,
              );
            }
          }

          //state has error
          else if (state is FavoritesError) {
            return Scaffold(
              body: Center(
                child: Text(state.message),
              ),
            );
          }
          return const Center(
            child: Text("Something went wrong..."),
          );
        },

        //LISTEN TO STATE
        listener: (context, state) {},
      ),
    );
  }

  Widget _buildExplorePage(BuildContext context, List<Photos> photos) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 0.75, // Adjust this to fit your needs
        ),
        itemCount: photos.length,
        itemBuilder: (context, index) {
          final photo = photos[index];
          return GestureDetector(
            onTap: () => showFavoritesBottomSheet(
              context: context,
              eachHit: photo,
              onDeleteCallback: () {
                setState(() {
                  final FavoritesCubit favoritesCubit =
                      context.read<FavoritesCubit>();

                  favoritesCubit.displayFavorites();
                });
              },
            ),
            child: Stack(
              children: [
                // Image container to ensure it takes full space
                CachedNetworkImage(
                  imageUrl: photo.src,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height:
                      double.infinity, // Makes the image take the full height

                  //placeholder while image is loading
                  placeholder: (context, url) => Scaffold(
                    body: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "L O A D I N G",
                              style: TextStyle(
                                fontSize: 8,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),

                  //error widget
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),

                // Overlay to give a fade effect
                Positioned.fill(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(15, 0, 0, 0),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
