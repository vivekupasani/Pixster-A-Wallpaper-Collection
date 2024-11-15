import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pixster/features/Home/presentation/components/my_drawer.dart';
import 'package:pixster/features/Home/presentation/pages/home_page.dart';
import 'package:pixster/features/explore/presentation/pages/explore_page.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  //initial index will be zero
  int _selectedIndex = 0;

  //list of pages
  final List<Widget> _pages = [
    const HomePage(),
    const ExplorePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //app bar
      appBar: AppBar(
        title: const Text("P I X S T E R"),
        centerTitle: true,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),

      //drawer
      drawer: const MyDrawer(),

      //bottom shit
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: GNav(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          mainAxisAlignment: MainAxisAlignment.center,
          activeColor: Theme.of(context).colorScheme.inversePrimary,
          color: Theme.of(context).colorScheme.inversePrimary,
          tabActiveBorder:
              Border.all(color: Theme.of(context).colorScheme.inversePrimary),
          gap: 5,
          iconSize: 24,
          textSize: 14,
          //selected index
          selectedIndex: _selectedIndex,
          //on tab clicked (changed)
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          //tabs like home,search
          tabs: const [
            GButton(
              icon: Icons.home,
              text: "Home",
            ),
            GButton(
              icon: Icons.explore,
              text: "Explore",
            ),
          ],
        ),
      ),

      //body
      body: _pages[_selectedIndex],
    );
  }
}
