import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newapp/app_theme.dart';
import 'package:newapp/modles/news_responce/article.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  NewsItem( this.news);

  final Article news;
  
  @override
  Widget build(BuildContext context) {
    final titleSmallStyle = Theme.of(context).textTheme.titleSmall;
    DateTime publishedAt = DateTime.tryParse(news.publishedAt ?? '') ?? DateTime.now();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            child: Image.network(
              news.urlToImage ??
                  "https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg",
              height: MediaQuery.of(context).size.height * 0.25,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            news.source?.name ?? '',
            style:
                titleSmallStyle?.copyWith(color: AppTheme.gray, fontSize: 10),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            news.title ?? '',
            style: titleSmallStyle?.copyWith(fontWeight: FontWeight.w500),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Text(
              timeago.format(publishedAt),
              style:
                  titleSmallStyle?.copyWith(color: AppTheme.gray, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
