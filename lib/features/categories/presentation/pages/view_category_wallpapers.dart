import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixster/features/Home/domain/photo.dart';
import 'package:pixster/features/Home/presentation/components/wallpaper_bottom_sheet.dart';
import 'package:pixster/features/categories/presentation/components/my_wallpaper_gridview.dart';
import 'package:pixster/features/categories/presentation/cubit/categories_cubit.dart';
import 'package:pixster/responsive/scafold_responsive.dart';

class ViewCategoryWallpapers extends StatefulWidget {
  final String categoryName;
  const ViewCategoryWallpapers({super.key, required this.categoryName});

  @override
  State<ViewCategoryWallpapers> createState() => _ViewCategoryWallpapersState();
}

class _ViewCategoryWallpapersState extends State<ViewCategoryWallpapers> {
  @override
  void initState() {
    super.initState();
    final CategoriesCubit categoriesCubit = context.read<CategoriesCubit>();
    categoriesCubit.getPopularWallpapers(widget.categoryName);
  }

  @override
  Widget build(BuildContext context) {
    return ScafoldResponsive(
      appBar: AppBar(
        title: Text(widget.categoryName),
      ),
      body: BlocConsumer<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          //state is loading
          if (state is CategoryLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );

            //state is loaded
          } else if (state is CategoryLoaded) {
            return state.photos.isEmpty
                ? const Center(
                    child: Text(
                      "No result found",
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                : MyWallpaperGridview(
                    context: context,
                    photos: state.photos,
                  );

            //state has error
          } else if (state is CategoryError) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(fontSize: 16, color: Colors.red),
              ),
            );
          }

          //Default state
          return const Center(
            child: Text("Something went wrong..."),
          );
        },
        listener: (context, state) {},
      ),
    );
  }

  //merged into MyWallpaperGridview F I L E
  Widget _buildExplorePage(BuildContext context, List<PhotoModel> photos) {
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
            onTap: () =>
                showWallpaperBottomSheet(context: context, eachHit: photo),
            child: Stack(
              children: [
                // Image container to ensure it takes full space
                CachedNetworkImage(
                  imageUrl: photo.src.original,
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
