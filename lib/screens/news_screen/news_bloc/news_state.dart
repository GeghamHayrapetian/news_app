import 'package:app_for_flutter_test/models/news_item_model.dart';
import 'package:equatable/equatable.dart';

abstract class NewsState extends Equatable {
  @override
  List<Object> get props => [];
}

class NewsInitialState extends NewsState {}

class LoadingNewsState extends NewsState {}

class NewsIsLoadedState extends NewsState {
  NewsIsLoadedState({required this.newsList});

  final List<NewsItemModel> newsList;

  @override
  List<Object> get props => [newsList];
}

class NewsLoadingErrorState extends NewsState {
  NewsLoadingErrorState({required this.errorMessage});

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
