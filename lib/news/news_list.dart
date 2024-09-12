import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:newapp/API/API_services.dart';
import 'package:newapp/modles/news_responce/news_responce.dart';
import 'package:newapp/modles/sourcesResponse/sources.responce.dart';
import 'package:newapp/news/news_item.dart';
import 'package:newapp/widget/error_indigator.dart';
import 'package:newapp/widget/loading_indigator.dart';

class NewsList extends StatelessWidget {
  NewsList( this.sourceID);

  final String sourceID;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: APIServices.getNews(sourceID),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingIndigator();
        } else if  (snapshot.hasError || snapshot.data?.status != 'ok') {
          return ErrorIndigator();
        }  else {
          final newsList = snapshot.data?.articles ?? [];
          return ListView.builder(
            itemBuilder: (_, index) => NewsItem(newsList[index]),
            itemCount: newsList.length,
          );
        }
      },
    );
  }
}
