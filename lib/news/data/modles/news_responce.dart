import 'article.dart';
class NewsResponce {
  final String? status;
  final int? totalResults;
  final List<Article>? articles;

  const NewsResponce({this.status, this.totalResults, this.articles});

  factory NewsResponce.fromJson(Map<String, dynamic> json) => NewsResponce(
        status: json['status'] as String?,
        totalResults: json['totalResults'] as int?,
        articles: (json['articles'] as List<dynamic>?)
            ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}
