import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newapp/app_theme.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final titleSmallStyle = Theme.of(context).textTheme.titleSmall;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            child: Image.asset(
              "assets/images/NewsTest.png",
              height: MediaQuery.of(context).size.height * 0.25,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            "BBC News",
            style:
                titleSmallStyle?.copyWith(color: AppTheme.gray, fontSize: 10),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            "sfadgfasd afjdasifhl asklfjdlks dskljfakl sdfada?",
            style: titleSmallStyle?.copyWith(fontWeight: FontWeight.w500),
          ),
          Align(
            alignment:Alignment.topRight,
            child: Text(
              timeago.format(DateTime.now()),
              style:
                  titleSmallStyle?.copyWith(color: AppTheme.gray, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
