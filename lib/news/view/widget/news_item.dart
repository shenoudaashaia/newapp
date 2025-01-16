import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newapp/news/view/widget/news_item_details.dart';
import 'package:newapp/shared/app_theme.dart';
import 'package:newapp/news/data/modles/article.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  const NewsItem(this.news, {super.key});
  final Article news;

  @override
  Widget build(BuildContext context) {
    final titleSmallStyle = Theme.of(context).textTheme.titleSmall;
    DateTime publishedAt =
        DateTime.tryParse(news.publishedAt ?? '') ?? DateTime.now();

    return GestureDetector(
      onTap: () => Navigator.of(context)
          .pushNamed(NewsItemDetails.routeName, arguments: news),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              child: CachedNetworkImage(
                imageUrl: news.urlToImage ??
                    "https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg",
                height: MediaQuery.of(context).size.height * 0.25,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              news.source?.name ?? '',
              style:
                  titleSmallStyle?.copyWith(color: AppTheme.gray, fontSize: 10),
            ),
            const SizedBox(
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
                style: titleSmallStyle?.copyWith(
                    color: AppTheme.gray, fontSize: 13),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
