import 'package:newapp/news/data/modles/article.dart';

abstract class NewsState {}

class NewsInitial extends NewsState {}

class GetNewsLoading extends NewsState {}

class GetNewsSuccess extends NewsState {
  final List<Article> newsList;
  GetNewsSuccess(this.newsList);
}

class GetNewsError extends NewsState {
  final String error;
  GetNewsError(this.error);
}
