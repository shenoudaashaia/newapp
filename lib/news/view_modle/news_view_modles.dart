import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newapp/news/data/reposatiory/news_reository.dart';
import 'package:newapp/news/view_modle/news_states.dart';
import 'package:newapp/shared/widget/service_locator.dart';

class NewsViewModel extends Cubit<NewsState> {
  final repository = NewsRepository(ServiceLocator.newsDataSource);
  NewsViewModel() : super(NewsInitial());
  static const int pageSize=10;

 
  Future<void> getNews(String sourceId, int pagekey) async {
    emit(GetNewsLoading());
    try {
      final newsList = await repository.getNews(sourceId,pagekey,pageSize);
      emit(GetNewsSuccess(newsList));
    } catch (error) {
      emit(GetNewsError(error.toString()));
    }
  }
}
