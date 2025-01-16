import 'package:flutter/material.dart';
import 'package:newapp/news/data/modles/news_responce.dart';
import 'package:newapp/home/view/widget/api_manger.dart';
import 'package:newapp/news/view/widget/news_item.dart';
import 'package:newapp/shared/app_theme.dart';
import 'package:newapp/shared/widget/error_indigator.dart';
import 'package:newapp/shared/widget/loading_indigator.dart';

class NewsSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => showResults(context),
        icon: const Icon(Icons.search),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => Navigator.of(context).pop(), icon: const Icon(Icons.close));
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildSuggestions(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return const Center(
        child: Text('Suggestions'),
      );
    }
    return FutureBuilder<NewsResponce>(
        future: ApiManger.searchNews(query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingIndigator();
          } else if (snapshot.hasError || snapshot.data!.status != 'ok') {
            return ErrorIndigator('Error');
          } else {
            final newsList = snapshot.data?.articles ?? [];
            return ListView.builder(
              itemBuilder: (_, index) => NewsItem(newsList[index]),
              itemCount: newsList.length,
            );
          }
        });
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      primaryColor: AppTheme.primary,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppTheme.primary,
        foregroundColor: Colors.white,
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 22, fontWeight: FontWeight.w400),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(32),
            right: Radius.circular(32),
          ),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        activeIndicatorBorder: BorderSide.none,
        enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
      ),
    );
  }
}
