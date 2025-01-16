import 'package:flutter/material.dart';
import 'package:newapp/sources/date/modle/sources.dart';
import 'package:newapp/news/view/widget/news_list.dart';
import 'package:newapp/sources/view/widget/tab_item.dart';

class SourcesTab extends StatefulWidget {
  SourcesTab(this.sources);

  final List<Source> sources;
  @override
  State<SourcesTab> createState() => _SourcesTabState();
}

class _SourcesTabState extends State<SourcesTab> {
  int selectedTabIndex = 0;

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
                
                    selectedTabIndex = index;
                  }),
              tabs: widget.sources
                  .map(
                    (source) => TabItem(
                      source: source.name ?? '',
                      isSelected:
                          widget.sources.indexOf(source) == selectedTabIndex,
                    ),
                  )
                  .toList()),
        ),
        Expanded(
          child: NewsList(widget.sources[selectedTabIndex].id ?? ""),
        ),
      ],
    );
  }
}
