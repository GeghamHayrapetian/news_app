import 'package:app_for_flutter_test/models/news_item_model.dart';
import 'package:app_for_flutter_test/repositories/api_repository.dart';
import 'package:app_for_flutter_test/screens/news_screen/news_bloc/news_event.dart';
import 'package:app_for_flutter_test/screens/news_screen/news_bloc/news_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsInitialState()) {
    on<LoadNewsEvent>(_loadNewsEvent);
  }

  final _apiRepository = ApiRepository();

  Future<void> _loadNewsEvent(
      LoadNewsEvent event, Emitter<NewsState> emit) async {
    emit(LoadingNewsState());
    late List<NewsItemModel> _list;
    try {
      _list = await _apiRepository.getNews();
      emit(NewsIsLoadedState(newsList: _list));
      return;
    } catch (e) {
      emit(NewsLoadingErrorState(errorMessage: e.toString()));
    }
  }
}
