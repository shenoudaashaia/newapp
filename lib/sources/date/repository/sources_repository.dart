import 'package:newapp/sources/date/data_source/source_data_source.dart';
import 'package:newapp/sources/date/modle/sources.dart';

class SourcesRepository {
  final SourcesDataSource dataSource;

  SourcesRepository(this.dataSource);

  Future<List<Source>> getSources(String categoryId) {
    return dataSource.getSource(categoryId);
  }
}
