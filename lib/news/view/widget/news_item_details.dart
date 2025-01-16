// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:newapp/news/data/modles/article.dart';
import 'package:newapp/shared/app_theme.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';

class NewsItemDetails extends StatelessWidget {
  static const String routeName = 'NewsDetails';

  const NewsItemDetails({super.key});


  @override
  Widget build(BuildContext context) {
    final titleSmallStyle = Theme.of(context).textTheme.titleSmall;
    var news = ModalRoute.of(context)!.settings.arguments as Article;
    DateTime publishedAt =
        DateTime.tryParse(news.publishedAt ?? '') ?? DateTime.now();
        
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.white,
        image: DecorationImage(image: AssetImage('assets/images/pattern.png')),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('News App'),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical:16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                child: Image.network(
                  news.urlToImage ??
                      'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg',
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                news.source!.name ?? '',
                style: titleSmallStyle?.copyWith(
                  color: AppTheme.gray,
                  fontSize: 10,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                news.title ?? '',
                style: titleSmallStyle?.copyWith(
                  color: AppTheme.navy,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Text(
                  timeago.format(publishedAt),
                  style: titleSmallStyle?.copyWith(
                      color: AppTheme.gray, fontSize: 13),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                news.description ?? '',
                style: titleSmallStyle?.copyWith(
                  color: AppTheme.navy,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      _launchUrl(news.url ?? '');
                    },
                    child: Text(
                      "View Full Article",
                      style:
                          titleSmallStyle?.copyWith(fontWeight: FontWeight.w800),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl(String newsUrl) async {
  if (newsUrl.isEmpty) {
    throw Exception('Invalid URL: URL cannot be empty');
  }

  final Uri _url = Uri.parse(newsUrl);
  try {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  } catch (e) {

    print('Error launching URL: $e');
  }

  }
}
