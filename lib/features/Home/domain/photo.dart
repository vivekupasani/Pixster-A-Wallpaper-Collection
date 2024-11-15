class PhotoModel {
  final int id;
  final int width;
  final int height;
  final String url;
  final String photographer;
  final String photographerUrl;
  final int photographerId;
  final String avgColor;
  final PhotoSrcModel src;
  final bool liked;
  final String alt;

  PhotoModel({
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

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      id: json['id'],
      width: json['width'],
      height: json['height'],
      url: json['url'],
      photographer: json['photographer'],
      photographerUrl: json['photographer_url'],
      photographerId: json['photographer_id'],
      avgColor: json['avg_color'],
      src: PhotoSrcModel.fromJson(json['src']),
      liked: json['liked'],
      alt: json['alt'],
    );
  }
}

class PhotoSrcModel {
  final String original;
  final String large2x;
  final String large;
  final String medium;
  final String small;
  final String portrait;
  final String landscape;
  final String tiny;

  PhotoSrcModel({
    required this.original,
    required this.large2x,
    required this.large,
    required this.medium,
    required this.small,
    required this.portrait,
    required this.landscape,
    required this.tiny,
  });

  factory PhotoSrcModel.fromJson(Map<String, dynamic> json) {
    return PhotoSrcModel(
      original: json['original'],
      large2x: json['large2x'],
      large: json['large'],
      medium: json['medium'],
      small: json['small'],
      portrait: json['portrait'],
      landscape: json['landscape'],
      tiny: json['tiny'],
    );
  }
}

class PhotoResponse {
  final int page;
  final int perPage;
  final List<PhotoModel> photos;
  final int totalResults;
  final String? nextPage;
  final String? prevPage;

  PhotoResponse({
    required this.page,
    required this.perPage,
    required this.photos,
    required this.totalResults,
    this.nextPage,
    this.prevPage,
  });

  factory PhotoResponse.fromJson(Map<String, dynamic> json) {
    return PhotoResponse(
      page: json['page'],
      perPage: json['per_page'],
      photos: (json['photos'] as List)
          .map((photoJson) => PhotoModel.fromJson(photoJson))
          .toList(),
      totalResults: json['total_results'],
      nextPage: json['next_page'],
      prevPage: json['prev_page'],
    );
  }
}
