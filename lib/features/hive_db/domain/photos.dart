import 'package:hive_flutter/hive_flutter.dart';

part 'photos.g.dart';

@HiveType(typeId: 0)
class Photos {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final int width;

  @HiveField(2)
  final int height;

  @HiveField(3)
  final String url;

  @HiveField(4)
  final String photographer;

  @HiveField(5)
  final String photographerUrl;

  @HiveField(6)
  final int photographerId;

  @HiveField(7)
  final String avgColor;

  @HiveField(8)
  final String src;

  @HiveField(9)
  final bool liked;

  @HiveField(10)
  final String alt;

  Photos({
    required this.id,
    required this.width,
    required this.height,
    required this.url,
    required this.photographer,
    required this.photographerUrl,
    required this.photographerId,
    required this.avgColor,
    required this.src,
    required this.liked,
    required this.alt,
  });
}
