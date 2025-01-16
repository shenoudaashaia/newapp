import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newapp/news/data/data_source/remote/news_remote_data_source.dart';
import 'package:newapp/news/data/modles/article.dart';
import 'package:newapp/shared/APi_constants.dart';
import 'package:newapp/news/data/modles/news_responce.dart';

class NewsApiDateSource extends NewsRemoteDataSource {
  @override
  Future<List<Article>> getNews(String sourceID,int page,int pageSize) async {
    final uri = Uri.https(
      APIConstants.baseUrl,
      APIConstants.newsEndpoint,
      {
        "apiKey": APIConstants.apiKey,
        "sources": sourceID,
        "page":page.toString(),
        "pageSize":pageSize.toString(),
      },
    );
    final response = await http.get(uri);

    final json = jsonDecode(response.body);
    final newsResponce = NewsResponce.fromJson(json);
    if (newsResponce.status == "ok" && newsResponce.articles != null) {
      return newsResponce.articles!;
    } else {
      throw Exception("error filed articles");
    }
  }
}
