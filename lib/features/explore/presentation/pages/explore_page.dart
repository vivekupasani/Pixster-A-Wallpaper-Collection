import 'package:flutter/material.dart';
import 'package:pixster/features/explore/presentation/pages/popular_tab.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return const PopularTab();
  }
}
