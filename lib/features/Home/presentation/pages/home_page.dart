import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:pixster/features/Home/domain/photo.dart';
import 'package:pixster/features/Home/presentation/components/wallpaper_bottom_sheet.dart';
import 'package:pixster/features/Home/presentation/cubit/home_cubit.dart';
import 'package:pixster/responsive/scafold_responsive.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    final HomeCubit homeCubit = context.read<HomeCubit>();
    homeCubit.getTrendingImages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},

      //BUILD UI
      builder: (context, state) {
        // State is loading
        if (state is HomeLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );

          // State is loaded
        } else if (state is HomeLoaded) {
          final photos = state.photos;
          return _buildHomeLoaded(context, photos!);

          // State is error
        } else if (state is HomeError) {
          return Scaffold(
            body: Center(
              child: Text(state.message),
            ),
          );
        }

        //Default state
        return const Scaffold(
          body: Center(
            child: Text("Something went wrong. Please try again later."),
          ),
        );
      },
    );
  }

  // Build UI for loaded state
  Widget _buildHomeLoaded(BuildContext context, List<PhotoModel> photos) {
    return ScafoldResponsive(
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Trending text
            Text(
              "Trending",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            const SizedBox(height: 10),

            //slogan text
            Text(
              "Discover What's Capturing Attention!",
              style: TextStyle(
                fontSize: 18,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            const SizedBox(height: 10),

            //carousel slider builder
            Expanded(
              child: CarouselSlider.builder(
                itemCount: photos.length,
                itemBuilder: (context, index, realIndex) {
                  final eachHit = photos[index];

                  //return a wallpaper tile
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),

                    //on Wallpaper tap
                    child: GestureDetector(
                      onTap: () => showWallpaperBottomSheet(
                        context: context,
                        eachHit: eachHit,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),

                        //wallpaper preview
                        child: Stack(
                          children: [
                            Positioned(
                              top: 0,
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: CachedNetworkImage(
                                imageUrl: eachHit.src.portrait,
                                placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                                fit: BoxFit.cover,
                              ),
                            ),

                            // Overlay to give a fade effect
                            Positioned.fill(
                              child: Container(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color.fromARGB(84, 0, 0,
                                          0), // Darker shade at the top
                                      Color.fromARGB(41, 0, 0,
                                          0), // Slightly transparent middle
                                      Color.fromARGB(80, 0, 0,
                                          0), // Darker shade at the bottom
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },

                //curousel options
                options: CarouselOptions(
                  height: 500, // Set height here
                  enlargeCenterPage: true,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
