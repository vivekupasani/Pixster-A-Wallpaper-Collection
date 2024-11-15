import 'package:flutter/material.dart';

class LikeButton extends StatefulWidget {
  final bool isLiked;
  final void Function()? onTap;
  const LikeButton({super.key, required this.isLiked, this.onTap});

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  @override
  Widget build(BuildContext context) {
    return !widget.isLiked
        ? GestureDetector(
            onTap: widget.onTap,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(105, 0, 0, 0),
                  shape: BoxShape.rectangle),
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Icon(
                  Icons.favorite_border,
                  color: Color.fromARGB(193, 255, 255, 255),
                ),
              ),
            ),
          )
        : GestureDetector(
            onTap: widget.onTap,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(105, 0, 0, 0),
                  shape: BoxShape.rectangle),
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
              ),
            ),
          );
  }
}
