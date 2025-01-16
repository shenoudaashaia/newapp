import 'package:newapp/news/data/data_source/remote/news_remote_data_source.dart';
import 'package:newapp/news/data/modles/article.dart';

class NewsFirebaseDataSource extends NewsRemoteDataSource {
  @override
  Future<List<Article>> getNews(String sourceID,int page, int pageSize)async {
    return [];
  }
}
