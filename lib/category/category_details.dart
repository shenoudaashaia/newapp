import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newapp/news/news_item.dart';
import 'package:newapp/tabes/tab_item.dart';

class CategoriesDetails extends StatefulWidget {
  final String categoryId;

  CategoriesDetails({required this.categoryId});

  @override
  State<CategoriesDetails> createState() => _CategoriesDetailsState();
}

class _CategoriesDetailsState extends State<CategoriesDetails> {
  int selectedTabindex = 0;
  final sources = List.generate(10, (index) => "source ${index}");
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: sources.length,
          child: TabBar(
              tabAlignment: TabAlignment.start,
              isScrollable: true,
              indicatorColor: Colors.transparent,
              dividerColor: Colors.transparent,
              onTap: (index) => setState(() {
                    selectedTabindex = index;
                  }),
              tabs: sources
                  .map(
                    (source) => TabItem(
                      isSelected: sources.indexOf(source) == selectedTabindex,
                      source: source,
                    ),
                  )
                  .toList()),
        ),
        Expanded(
            child: ListView.builder(
          itemBuilder: (_, index) => NewsItem(),
          itemCount: 10,
        )),
      ],
    );
  }
}
