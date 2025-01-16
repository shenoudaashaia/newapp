import 'package:newapp/news/data/data_source/remote/news_remote_data_source.dart';
import 'package:newapp/news/data/modles/article.dart';

class NewsRepository {
  final NewsRemoteDataSource dataSource;
  NewsRepository(this.dataSource);
  Future<List<Article>> getNews(String sourceID, int page, int pageSize) {
    return dataSource.getNews(sourceID,page,pageSize);
  }
}
