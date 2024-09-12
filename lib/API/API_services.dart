import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newapp/API/APi_constants.dart';
import 'package:newapp/modles/news_responce/news_responce.dart';

class APIServices {
  static Future<NewsResponce?> getNews(String sourceID) async {
    try {
      final uri = Uri.https(
        APIConstants.baseUrl,
        APIConstants.newsEndpoint,
        {
          "apiKey": APIConstants.apiKey,
          "sources": sourceID,
        },
      );
      final response = await http.get(uri);
      final json = jsonDecode(response.body);
      return NewsResponce.fromJson(json);
    } catch (error) {
      print(error);
    }
  }
}
