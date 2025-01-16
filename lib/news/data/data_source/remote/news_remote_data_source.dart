import 'package:newapp/news/data/modles/article.dart';

abstract class NewsRemoteDataSource {
  Future<List<Article>> getNews(String sourceID, int page, int pageSize);
}
