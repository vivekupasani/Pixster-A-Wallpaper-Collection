import 'package:flutter/material.dart';

class MyCategoryTile extends StatefulWidget {
  final void Function()? onTap;
  final String categoryName;
  final String categoryBackgroundImageUrl;
  const MyCategoryTile({
    super.key,
    this.onTap,
    required this.categoryName,
    required this.categoryBackgroundImageUrl,
  });

  @override
  State<MyCategoryTile> createState() => _MyCategoryTileState();
}

class _MyCategoryTileState extends State<MyCategoryTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      //on tap
      child: GestureDetector(
        onTap: widget.onTap,
        //design container
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(8)),
          height: 180,
          width: double.infinity,
          child: Stack(
            children: [
              //show category image in background
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Image.network(
                  widget
                      .categoryBackgroundImageUrl, // Replace with your image URL
                  fit: BoxFit.fill,
                  height: 180, // Adjust the height as needed
                ),
              ),

              //show fade between image and title
              Container(
                height: 180,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(54, 0, 0, 0),
                ),
              ),

              //show category name
              Center(
                child: Text(
                  widget.categoryName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
