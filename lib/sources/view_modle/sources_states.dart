import 'package:newapp/sources/date/modle/sources.dart';

abstract class SourcesState {}

class SourceInitial extends SourcesState {}

class GetSourcesLoading extends SourcesState {}

class GetSourcesSuccess extends SourcesState {
  List<Source> sources;
  GetSourcesSuccess(this.sources);
}

class GetSourcesError extends SourcesState {
  final String errorMassage;

  GetSourcesError(this.errorMassage);
}
