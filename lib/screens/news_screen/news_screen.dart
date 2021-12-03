import 'package:app_for_flutter_test/models/news_item_model.dart';
import 'package:app_for_flutter_test/screens/news_screen/news_bloc/news_bloc.dart';
import 'package:app_for_flutter_test/screens/news_screen/news_bloc/news_state.dart';
import 'package:app_for_flutter_test/screens/news_screen/shared/news_item_widget.dart';
import 'package:app_for_flutter_test/shared/app_bar_widget.dart';
import 'package:app_for_flutter_test/shared/constants.dart';
import 'package:app_for_flutter_test/shared/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsScreen extends StatefulWidget {
  @override
  State createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  NewsBloc get _newsBloc => BlocProvider.of<NewsBloc>(context);
  @override
  Widget build(BuildContext context) {
    return _render();
  }

  Widget _render() {
    return BlocProvider.value(
        value: _newsBloc,
        child: BlocBuilder<NewsBloc, NewsState>(
            builder: (context, state) => Scaffold(
                resizeToAvoidBottomInset: false,
                body: _renderFieldOnScreen(state))));
  }

  Widget _renderFieldOnScreen(NewsState state) {
    return SafeArea(
      bottom: false,
      child: Stack(children: [
        Column(
          children: [
            _renderAppBar(),
            Expanded(child: _renderMainOnScreen(state))
          ],
        ),
      ]),
    );
  }

  Widget _renderAppBar() {
    return AppBarWidget(
      titleText: 'News',
    );
  }

  Widget _renderErrorMessage(String error) {
    return Center(
        child: Text(
      error,
      style: getStyle(),
    ));
  }

  Widget _renderListOfNews(List<NewsItemModel> newsList) {
    return Padding(
      padding: EdgeInsets.only(top: 20 * rh(context)),
      child: ListView.builder(
        itemCount: newsList.length,
        itemBuilder: (context, index) {
          return NewsItemWidget(item: newsList[index]);
        },
      ),
    );
  }

  Widget _renderLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _renderMainOnScreen(NewsState state) {
    if (state is LoadingNewsState) {
      return _renderLoading();
    }
    if (state is NewsLoadingErrorState) {
      return _renderErrorMessage(state.errorMessage);
    }
    if (state is NewsIsLoadedState) {
      return _renderListOfNews(state.newsList);
    }
    return Container();
  }
}
