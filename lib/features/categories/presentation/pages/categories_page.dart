import 'package:flutter/material.dart';
import 'package:pixster/features/categories/presentation/components/my_category_tile.dart';
import 'package:pixster/features/categories/presentation/pages/view_category_wallpapers.dart';
import 'package:pixster/responsive/scafold_responsive.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  void onCategoryTap(String categoryName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ViewCategoryWallpapers(categoryName: categoryName),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScafoldResponsive(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("C A T E G O R I E S"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 390),
            child: ListView(
              children: [
                //1
                MyCategoryTile(
                  categoryName: "N A T U R E",
                  categoryBackgroundImageUrl:
                      "https://wallpapercave.com/wp/wp6689718.jpg",
                  onTap: () => onCategoryTap("Nature"),
                ),

                //2
                MyCategoryTile(
                  categoryName: "F L O W E R S",
                  categoryBackgroundImageUrl:
                      "https://img.goodfon.com/wallpaper/big/4/41/cvety-cvetochek-roza-krasnaya.webp",
                  onTap: () => onCategoryTap("Flowers"),
                ),

                //3
                MyCategoryTile(
                  categoryName: "M O U N T A I N",
                  categoryBackgroundImageUrl:
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuFVVAHBr69qqNCtpILUNqCAfRAETxJXFQOQ&s",
                  onTap: () => onCategoryTap("Mountain"),
                ),

                //1
                MyCategoryTile(
                  categoryName: "A N I M A L S",
                  categoryBackgroundImageUrl:
                      "https://c4.wallpaperflare.com/wallpaper/216/195/664/animal-lion-black-and-white-photography-dark-background-wallpaper-preview.jpg",
                  onTap: () => onCategoryTap("Animals"),
                ),

                //1
                MyCategoryTile(
                  categoryName: "B I R D S",
                  categoryBackgroundImageUrl:
                      "https://images.unsplash.com/photo-1643338364815-052f09c8234b?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8ZGFyayUyMGJpcmR8ZW58MHx8MHx8fDA%3D",
                  onTap: () => onCategoryTap("Birds"),
                ),

                //1
                MyCategoryTile(
                  categoryName: "S P A C E",
                  categoryBackgroundImageUrl:
                      "https://e1.pxfuel.com/desktop-wallpaper/767/147/desktop-wallpaper-of-astronaut-space-art-sci-fi-backgrounds-astronaut-in-outer-space.jpg",
                  onTap: () => onCategoryTap("Space"),
                ),

                //1
                MyCategoryTile(
                  categoryName: "A B S T R A C T",
                  categoryBackgroundImageUrl:
                      "https://img.freepik.com/free-vector/gradient-black-background-with-wavy-lines_23-2149157314.jpg",
                  onTap: () => onCategoryTap("Abstract"),
                ),

                //1
                MyCategoryTile(
                  categoryName: "A R T",
                  categoryBackgroundImageUrl:
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFzKA3fm6y6FFU9iuhS5JZaM6uFYlSj0n3RQ&s",
                  onTap: () => onCategoryTap("Art"),
                ),

                //1
                MyCategoryTile(
                  categoryName: "M I N I M A L",
                  categoryBackgroundImageUrl:
                      "https://c4.wallpaperflare.com/wallpaper/89/177/75/artistic-minimalism-black-and-white-minimalist-wallpaper-preview.jpg",
                  onTap: () => onCategoryTap("Minimal"),
                ),

                //1
                MyCategoryTile(
                  categoryName: "T E X T U R E",
                  categoryBackgroundImageUrl:
                      "https://wallpapers.com/images/hd/black-texture-background-m9tu1dmzl88utvcn.jpg",
                  onTap: () => onCategoryTap("Texture"),
                ),

                //1
                MyCategoryTile(
                  categoryName: "N E O N",
                  categoryBackgroundImageUrl:
                      "https://c4.wallpaperflare.com/wallpaper/280/299/782/monochrome-neon-wallpaper-preview.jpg",
                  onTap: () => onCategoryTap("Neon"),
                ),

                //1
                MyCategoryTile(
                  categoryName: "C O L O R F U L L",
                  categoryBackgroundImageUrl:
                      "https://wallpapers.com/images/hd/black-rainbow-5njswvlnysl4qb2d.jpg",
                  onTap: () => onCategoryTap("Colorfull"),
                ),

                //1
                MyCategoryTile(
                  categoryName: "C A R T O O N",
                  categoryBackgroundImageUrl:
                      "https://www.hdwallpapers.in/download/trolls_world_tour_guitar_black_background_hd_cartoon-HD.jpg",
                  onTap: () => onCategoryTap("Cartoon"),
                ),

                //1
                MyCategoryTile(
                  categoryName: "F O O D",
                  categoryBackgroundImageUrl:
                      "https://c4.wallpaperflare.com/wallpaper/192/942/370/pepper-red-hot-food-wallpaper-preview.jpg",
                  onTap: () => onCategoryTap("Food"),
                ),

                //1
                MyCategoryTile(
                  categoryName: "L O V E",
                  categoryBackgroundImageUrl:
                      "https://images8.alphacoders.com/865/thumb-1920-865094.jpg",
                  onTap: () => onCategoryTap("Love"),
                ),

                //1
                MyCategoryTile(
                  categoryName: "T O U R I S M",
                  categoryBackgroundImageUrl:
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFWRkwcxvsSHBvJ5timPe_FqgEe5uljMyiew&s",
                  onTap: () => onCategoryTap("Tourism"),
                ),

                //1
                MyCategoryTile(
                  categoryName: "V E H I C L E S",
                  categoryBackgroundImageUrl:
                      "https://wallpapers.com/images/hd/black-car-4k-a6ay51d8d0pyex23.jpg",
                  onTap: () => onCategoryTap("Vehicles"),
                ),

                //1
                MyCategoryTile(
                  categoryName: "W I N T E R",
                  categoryBackgroundImageUrl:
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDMd8f20lGtBqrbxrzGR8QEQihdE0Uxwrwvg&s",
                  onTap: () => onCategoryTap("Winter"),
                ),

                //1
                MyCategoryTile(
                  categoryName: "S T O C K",
                  categoryBackgroundImageUrl:
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIdyGTgSe0DyTazBGLuCewbu815rSRmT2iJg&s",
                  onTap: () => onCategoryTap("Stock"),
                ),
              ],
            ),
          ),
        ));
  }
}
