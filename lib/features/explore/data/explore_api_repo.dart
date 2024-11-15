import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:pixster/features/Home/domain/photo.dart';
import 'package:pixster/features/explore/domain/explore_repo.dart';
import 'package:http/http.dart' as http;

class ExploreApiRepo implements ExploreRepo {
  final String _apiKey =
      "2AB3WsUO4SkAN2Zf6DbhwSXxhtCiYxEuQKMQiDIHu8VDKFxbGHIt0U5g";

  //get popular wallpapers
  @override
  Future<List<PhotoModel>?> getPopularWallpapers(String query) async {
    final Uri uri;
    try {
      //define the API endpoint
      if (query.isEmpty) {
        uri = Uri.parse("https://api.pexels.com/v1/search?query=bestwallpaper");
      } else {
        uri = Uri.parse("https://api.pexels.com/v1/search?query=$query");
      }

      // Define headers for authentication
      final headers = {"Authorization": _apiKey};

      //Make a GET request
      final http.Response res = await http.get(uri, headers: headers);

      //checkk status code
      if (res.statusCode == 200) {
        final jsonResponse = jsonDecode(res.body);

        //print response in console
        if (kDebugMode) {
          print(jsonResponse);
        }

        //convert JSON into photo model
        final List<PhotoModel> photos = (jsonResponse['photos'] as List)
            .map(
              (photos) => PhotoModel.fromJson(photos as Map<String, dynamic>),
            )
            .toList();

        //return a list of photos
        return photos;
      }
      //return null if status code is != 200
      return null;
    } catch (e) {
      throw Exception("Error: ${e.toString()}");
    }
  }
}
