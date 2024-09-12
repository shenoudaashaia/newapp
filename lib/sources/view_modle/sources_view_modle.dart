import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:newapp/sources/date/data_source/sources_date_source.dart';

class SourcesViewModle with ChangeNotifier {
  final dateSource = SourcesDateSource();



  Future<void> getSources(String categoryId) async {
  final  response = await dateSource.getServices(categoryId);
  
  }
}
