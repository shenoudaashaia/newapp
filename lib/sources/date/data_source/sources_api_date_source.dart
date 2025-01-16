import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newapp/shared/APi_constants.dart';
import 'package:newapp/sources/date/data_source/source_data_source.dart';
import 'package:newapp/sources/date/modle/sources.dart';
import 'package:newapp/sources/date/modle/sources.responce.dart';

class SourcesApiDateSource extends SourcesDataSource{
  @override
  Future<List<Source>> getSource(String categoryId) async {
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
    final sourceResponse = Sources.fromJson(json);
    if (sourceResponse.status == "ok" && sourceResponse.sources != null) {
      return sourceResponse.sources!;
    } else {
      throw Exception("failed to get source");
    }
  }
}
