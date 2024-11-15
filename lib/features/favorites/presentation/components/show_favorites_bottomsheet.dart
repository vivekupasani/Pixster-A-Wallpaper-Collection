// ignore_for_file: use_build_context_synchronously

import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_downloader_flutter/file_downloader_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_downloader_web/image_downloader_web.dart';
import 'package:pixster/features/hive_db/data/hive_db_repo.dart';
import 'package:pixster/features/hive_db/domain/photos.dart';

void downloadWallpaper(BuildContext context, Photos eachHit) async {
  try {
    //check current platform is web or app
    if (kIsWeb) {
      //Download web image
      await WebImageDownloader.downloadImageFromWeb(eachHit.src);


      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Downloaded successfully!"),
        ),
      );
    } else {
      //Download app image
      FileDownloaderFlutter().urlFileSaver(
        url: eachHit.src,
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

void onDeleteButtonClick(
    BuildContext context, Photos wallpaper, VoidCallback onDeleteCallback) {
  try {
    HiveDbRepo().deleteToFavorite(wallpaper);

    // Close the bottom sheet
    Navigator.of(context).pop();

    // Trigger a state update in the calling widget
    onDeleteCallback();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Deleted successfully!"),
      ),
    );
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Download failed!"),
      ),
    );
  }
}

void showFavoritesBottomSheet({
  required BuildContext context,
  required Photos eachHit,
  required VoidCallback onDeleteCallback,
}) {
  showModalBottomSheet(
    context: context,
    elevation: 30,
    clipBehavior: Clip.hardEdge,
    isScrollControlled: true,
    backgroundColor: Theme.of(context).colorScheme.secondary,
    builder: (context) {
      return ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 450,
        ),
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height / 1.1,
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      // Wallpaper preview
                      CachedNetworkImage(
                        height: MediaQuery.of(context).size.height / 1.6,
                        width: double.infinity,
                        fit: BoxFit.fill,
                        imageUrl: eachHit.src,
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
                                shape: BoxShape.rectangle),
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

                      // Remove from favorites button
                      Positioned(
                        top: 16,
                        left: 16,
                        child: GestureDetector(
                          onTap: () => onDeleteButtonClick(
                              context, eachHit, onDeleteCallback),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color.fromARGB(105, 0, 0, 0),
                                shape: BoxShape.rectangle),
                            child: const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Icon(
                                Icons.delete,
                                color: Color.fromARGB(193, 255, 255, 255),
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
                        eachHit.alt,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Download button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 44.0),
                    child: GestureDetector(
                      onTap: () => downloadWallpaper(context, eachHit),
                      child: Container(
                        padding: const EdgeInsets.only(top: 22, bottom: 22),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
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
                                  fontSize: 18),
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
                          "${eachHit.width}x${eachHit.height}",
                          style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                              fontWeight: FontWeight.normal,
                              fontSize: 16),
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
                          eachHit.photographer,
                          style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                              fontWeight: FontWeight.normal,
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Copyright notice
                  const Center(
                    child: Text(
                      "Copyright @Pixel API",
                      style: TextStyle(
                          color: Color.fromARGB(255, 56, 56, 56),
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
