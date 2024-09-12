import 'package:flutter/material.dart';
import 'package:newapp/sources/date/modle/sources.dart';
import 'package:newapp/news/news_item.dart';
import 'package:newapp/news/news_list.dart';
import 'package:newapp/sources/view/widget/tab_item.dart';

class SourcesTab extends StatefulWidget {
  SourcesTab({required this.sources});

  final List<Source> sources;
  @override
  State<SourcesTab> createState() => _SourcesTabState();
}

class _SourcesTabState extends State<SourcesTab> {
  int selectedTabindex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: widget.sources.length,
          child: TabBar(
              tabAlignment: TabAlignment.start,
              isScrollable: true,
              indicatorColor: Colors.transparent,
              dividerColor: Colors.transparent,
              onTap: (index) => setState(() {
                    selectedTabindex = index;
                  }),
              tabs: widget.sources
                  .map(
                    (source) => TabItem(
                      isSelected:
                          widget.sources.indexOf(source) == selectedTabindex,
                      source: source.name ?? '',
                    ),
                  )
                  .toList()),
        ),
        Expanded(
            child:NewsList(widget.sources[selectedTabindex].id ?? '')),
      ],
    );
  }
}
