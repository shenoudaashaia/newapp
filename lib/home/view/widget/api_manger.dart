import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:newapp/shared/APi_constants.dart';

import 'package:newapp/news/data/modles/news_responce.dart';

class ApiManger {
  static Future<NewsResponce> searchNews(
      [String? query, String? sourceId]) async {
    final uri = Uri.https(
      APIConstants.baseUrl,
      APIConstants.newsEndpoint,
      {'apikey': APIConstants.apiKey, 'source': sourceId, 'q': query},
    );
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return NewsResponce.fromJson(json);
  }
}
