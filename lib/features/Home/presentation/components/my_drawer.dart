import 'package:flutter/material.dart';
import 'package:pixster/features/Home/presentation/components/my_drawer_tile.dart';
import 'package:pixster/features/categories/presentation/pages/categories_page.dart';
import 'package:pixster/features/favorites/presentation/favorites_page.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // App logo
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: Icon(
                    Icons.person,
                    size: 82,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),

                //divider
                Divider(
                  indent: 20,
                  endIndent: 20,
                  color: Theme.of(context).colorScheme.secondary,
                ),

                //Home tile
                MyDrawerTile(
                  title: "H O M E",
                  icon: Icons.home,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),

                //Favorites tile
                MyDrawerTile(
                  title: "F A V O R I T E S",
                  icon: Icons.favorite,
                  onTap: () {
                    //pop then drawer
                    Navigator.pop(context);

                    // Navigate to Favorites page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FavoritesPage(),
                      ),
                    );
                  },
                ),

                //Categories tile
                MyDrawerTile(
                  title: "C A T E G O R I E S",
                  icon: Icons.collections,
                  onTap: () {
                    //pop the drawer
                    Navigator.pop(context);

                    //navigate to Favorites page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CategoriesPage(),
                      ),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
