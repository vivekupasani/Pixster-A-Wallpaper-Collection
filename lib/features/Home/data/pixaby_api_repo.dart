import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:pixster/features/Home/domain/photo.dart';
import 'package:pixster/features/Home/domain/pixaby_repo.dart';

class PixabyApiRepo implements PixabyRepo {
  final http.Client client;
  final String _apiKey =
      "2AB3WsUO4SkAN2Zf6DbhwSXxhtCiYxEuQKMQiDIHu8VDKFxbGHIt0U5g";

  PixabyApiRepo({required this.client});

  @override
  Future<List<PhotoModel>?> getTrendingImages() async {
    try {
      // Define the API endpoint
      final uri = Uri.parse("https://api.pexels.com/v1/search?query=popular");

      // Define headers for authentication
      final headers = {"Authorization": _apiKey};

      // Make the GET request
      final http.Response res = await client.get(uri, headers: headers);

      // Check for a successful response
      if (res.statusCode == 200) {
        // Parse response into JSON
        final jsonResponse = jsonDecode(res.body);

        //print response in console
        if (kDebugMode) {
          print(jsonResponse);
        }

        // Convert JSON into a list of PhotoModel instances
        final List<PhotoModel> photos = (jsonResponse['photos'] as List)
            .map((photo) => PhotoModel.fromJson(photo as Map<String, dynamic>))
            .toList();

        // Return the list of PhotoModel objects
        return photos;
      } else {
        // Throw an error if the status code isn't 200
        throw Exception("Failed to load trending images: ${res.statusCode}");
      }
    } catch (e) {
      // Handle and throw any other exceptions
      throw Exception("Error: ${e.toString()}");
    }
  }
}
