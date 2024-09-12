import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newapp/API/API_services.dart';
import 'package:newapp/tabes/sources_tab.dart';
import 'package:newapp/widget/error_indigator.dart';
import 'package:newapp/widget/loading_indigator.dart';

class CategoriesDetails extends StatelessWidget {
  final String categoryId;

  CategoriesDetails({required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: APIServices.getServices(categoryId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingIndigator();
        } else if (snapshot.hasError || snapshot.data?.status != 'ok') {
          return ErrorIndigator();
        } else {
          final sources = snapshot.data?.sources ?? [];
          return SourcesTab(sources: sources);
        }
      },
    );
  }
}
