import 'package:newapp/sources/date/modle/sources.dart';

abstract class SourcesDataSource {
  Future<List<Source>> getSource(String sourceId);
}
