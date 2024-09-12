import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newapp/API/APi_constants.dart';
import 'package:newapp/sources/date/modle/sources.responce.dart';

class SourcesDateSource{
     Future<Sources> getServices(String categoryId) async {
    final uri = Uri.https(
      APIConstants.baseUrl,
      APIConstants.sourceEndpoint,
      {
        "apiKey": APIConstants.apiKey,
        "category": categoryId,
      },
    );
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return Sources.fromJson(json);
  }
}