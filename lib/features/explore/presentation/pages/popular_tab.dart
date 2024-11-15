import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixster/features/Home/domain/photo.dart';
import 'package:pixster/features/Home/presentation/components/wallpaper_bottom_sheet.dart';
import 'package:pixster/features/categories/presentation/components/my_wallpaper_gridview.dart';
import 'package:pixster/features/explore/presentation/cubit/explore_cubit.dart';
import 'package:pixster/responsive/scafold_responsive.dart';

class PopularTab extends StatefulWidget {
  const PopularTab({super.key});

  @override
  State<PopularTab> createState() => _PopularTabState();
}

class _PopularTabState extends State<PopularTab> {
  final TextEditingController queryController = TextEditingController();

  void onSearch() {
    final ExploreCubit exploreCubit = context.read<ExploreCubit>();
    exploreCubit.getPopularWallpapers(queryController.text);
  }

  @override
  void initState() {
    super.initState();
    final ExploreCubit exploreCubit = context.read<ExploreCubit>();
    exploreCubit.getPopularWallpapers(queryController.text);
    queryController.addListener(onSearch);
  }

  @override
  Widget build(BuildContext context) {
    return ScafoldResponsive(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: TextField(
              controller: queryController,
              decoration: InputDecoration(
                hintText: "Find your perfect wallpaper...",
                hintStyle: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2.0,
                    color: Color.fromARGB(193, 255, 255, 255),
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: BlocConsumer<ExploreCubit, ExploreState>(
              builder: (context, state) {
                if (state is ExploreLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is ExploreLoaded) {
                  return state.photos.isEmpty
                      ? const Center(
                          child: Text(
                            "N O  R E S U L T  F O U N D",
                            style: TextStyle(fontSize: 16),
                          ),
                        )
                      : MyWallpaperGridview(
                          context: context,
                          photos: state.photos,
                        );
                } else if (state is ExploreError) {
                  return Center(
                    child: Text(
                      state.message,
                      style: const TextStyle(fontSize: 16, color: Colors.red),
                    ),
                  );
                }
                return const Center(
                  child: Text("Hello, this is the explore page."),
                );
              },
              listener: (context, state) {},
            ),
          ),
        ],
      ),
    );
  }

  //merged into MyWallpaperGridview F I L E
  Widget _buildExplorePage(BuildContext context, List<PhotoModel> photos) {
    return ScafoldResponsive(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            childAspectRatio: 0.65,
          ),
          itemCount: photos.length,
          itemBuilder: (context, index) {
            final photo = photos[index];
            return ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 300, maxWidth: 300),
              child: GestureDetector(
                onTap: () =>
                    showWallpaperBottomSheet(context: context, eachHit: photo),
                child: Stack(
                  children: [
                    CachedNetworkImage(
                      //show image
                      imageUrl: photo.src.original,
                      fit: BoxFit.cover,
                      height: 200,

                      //placeholder while image is loading
                      placeholder: (context, url) => Center(
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

                      //error widgegt
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),

                    //show fade between image and title
                    Container(
                      height: 180,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(15, 0, 0, 0),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
