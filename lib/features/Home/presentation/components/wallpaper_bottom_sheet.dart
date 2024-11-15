import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_downloader_flutter/file_downloader_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:image_downloader_web/image_downloader_web.dart';
import 'package:pixster/features/Home/domain/photo.dart';
import 'package:pixster/features/hive_db/data/hive_db_repo.dart';
import 'package:pixster/features/hive_db/domain/constants.dart';
import 'package:pixster/features/hive_db/domain/photos.dart';

void showWallpaperBottomSheet({
  required BuildContext context,
  required PhotoModel eachHit,
}) {
  showModalBottomSheet(
    context: context,
    elevation: 30,
    clipBehavior: Clip.hardEdge,
    isScrollControlled: true,
    backgroundColor: Theme.of(context).colorScheme.secondary,
    builder: (context) {
      return WallpaperBottomSheet(eachHit: eachHit);
    },
  );
}

class WallpaperBottomSheet extends StatefulWidget {
  final PhotoModel eachHit;

  const WallpaperBottomSheet({super.key, required this.eachHit});

  @override
  // ignore: library_private_types_in_public_api
  _WallpaperBottomSheetState createState() => _WallpaperBottomSheetState();
}

class _WallpaperBottomSheetState extends State<WallpaperBottomSheet> {
  late bool isLiked;

  @override
  void initState() {
    super.initState();
    // Initialize isLiked based on whether it's in the favorites list
    isLiked = boxPhotos.containsKey(widget.eachHit.id);
  }

  //function to download wallpaper
  void downloadWallpaper(BuildContext context, PhotoModel eachHit) async {
    try {
      //check current platform is web or app
      if (kIsWeb) {
        //Download web image
        await WebImageDownloader.downloadImageFromWeb(eachHit.src.original);


        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Downloaded successfully!"),
          ),
        );
      } else {
        //Download app image
        FileDownloaderFlutter().urlFileSaver(
          url: eachHit.src.original,
          fileName: "${eachHit.alt} wallpaper by pixster",
        );


        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Downloaded successfully!"),
          ),
        );
      }
    } catch (e) {
      if (kIsWeb) {
        print(e);
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Download failed!"),
        ),
      );
    }
  }

  //function to toggle favorites
  void toggleFavorite() {
    //prepare photo model
    final photo = Photos(
      id: widget.eachHit.id,
      width: widget.eachHit.width,
      height: widget.eachHit.height,
      url: widget.eachHit.url,
      photographer: widget.eachHit.photographer,
      photographerUrl: widget.eachHit.photographerUrl,
      photographerId: widget.eachHit.photographerId,
      avgColor: widget.eachHit.avgColor,
      src: widget.eachHit.src.original,
      liked: widget.eachHit.liked,
      alt: widget.eachHit.alt,
    );

    //set the state
    setState(
      () {
        isLiked = !isLiked;

        //check if isLiked
        if (isLiked) {
          // Add to favorites
          HiveDbRepo().addToFavorite(photo);
        } else {
          // Remove from favorites (if required)
          HiveDbRepo().deleteToFavorite(photo);
        }
      },
    );
  }

  //BUILD UI
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 450,
      ),
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height / 1.1,
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    // Wallpaper preview
                    CachedNetworkImage(
                      height: MediaQuery.of(context).size.height / 1.6,
                      width: double.infinity,
                      fit: BoxFit.fill,
                      imageUrl: widget.eachHit.src.portrait,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),

                    // Close button
                    Positioned(
                      top: 16,
                      right: 16,
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(105, 0, 0, 0),
                            shape: BoxShape.rectangle,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Icon(
                              Icons.close,
                              color: Color.fromARGB(193, 255, 255, 255),
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Add to favorite button
                    Positioned(
                      top: 16,
                      left: 16,
                      child: GestureDetector(
                        onTap: toggleFavorite,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(105, 0, 0, 0),
                            shape: BoxShape.rectangle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Icon(
                              isLiked ? Icons.favorite : Icons.favorite_border,
                              color: isLiked ? Colors.red : Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Caption of wallpaper
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      widget.eachHit.alt,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Download button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 44.0),
                  child: GestureDetector(
                    onTap: () => downloadWallpaper(context, widget.eachHit),
                    child: Container(
                      padding: const EdgeInsets.only(top: 22, bottom: 22),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.download,
                            color: Colors.black,
                          ),
                          Text(
                            "Get Wallpaper",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Height and Width
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      const Icon(Icons.aspect_ratio),
                      const SizedBox(width: 8),
                      Text(
                        "${widget.eachHit.width}x${widget.eachHit.height}",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Photographer name
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      const Icon(Icons.person),
                      const SizedBox(width: 8),
                      Text(
                        widget.eachHit.photographer,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),

                // Copyright @Pixel API
                const Center(
                  child: Text(
                    "Copyright @Pixel API",
                    style: TextStyle(
                      color: Color.fromARGB(255, 56, 56, 56),
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
