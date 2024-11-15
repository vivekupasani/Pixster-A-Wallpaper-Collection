import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pixster/features/Home/domain/photo.dart';
import 'package:pixster/features/Home/presentation/components/wallpaper_bottom_sheet.dart';
import 'package:pixster/responsive/scafold_responsive.dart';

class MyWallpaperGridview extends StatefulWidget {
  final BuildContext context;
  final List<PhotoModel> photos;
  const MyWallpaperGridview(
      {super.key, required this.context, required this.photos});

  @override
  State<MyWallpaperGridview> createState() => _MyWallpaperGridviewState();
}

class _MyWallpaperGridviewState extends State<MyWallpaperGridview> {
  @override
  Widget build(BuildContext context) {
    return ScafoldResponsive(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 0.75, // Adjust this to fit your needs
              ),
              itemCount: widget.photos.length,
              itemBuilder: (context, index) {
                final photo = widget.photos[index];
                return GestureDetector(
                  onTap: () => showWallpaperBottomSheet(
                      context: context, eachHit: photo),
                  child: Stack(
                    children: [
                      // Image container to ensure it takes full space
                      CachedNetworkImage(
                        imageUrl: photo.src.original,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double
                            .infinity, // Makes the image take the full height

                        //placeholder while image is loading
                        placeholder: (context, url) => Scaffold(
                          body: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircularProgressIndicator(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "L O A D I N G",
                                    style: TextStyle(
                                      fontSize: 8,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),

                        //error widget
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
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
          ],
        ),
      ),
    );
  }
}
