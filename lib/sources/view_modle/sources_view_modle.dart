import 'package:bloc/bloc.dart';
import 'package:newapp/shared/widget/service_locator.dart';
import 'package:newapp/sources/date/repository/sources_repository.dart';
import 'package:newapp/sources/view_modle/sources_states.dart';

class SourcesViewModle extends Cubit<SourcesState> {
  final repository = SourcesRepository(ServiceLocator.sourceDataSource);

  SourcesViewModle() : super(SourceInitial()) {}

  Future<void> getSources(String categoryId) async {
    emit(GetSourcesLoading());
    try {
      final sources = await repository.getSources(categoryId);
      emit(GetSourcesSuccess(sources));
    } catch (error) {
      emit(GetSourcesError(error.toString()));
    } 
  }
}
