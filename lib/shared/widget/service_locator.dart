import 'package:newapp/news/data/data_source/remote/news_api_data_source.dart';
import 'package:newapp/news/data/data_source/remote/news_remote_data_source.dart';
import 'package:newapp/sources/date/data_source/sources_api_date_source.dart';

class ServiceLocator {
  static SourcesApiDateSource sourceDataSource = SourcesApiDateSource();
  static NewsRemoteDataSource newsDataSource = NewsApiDateSource();
}
