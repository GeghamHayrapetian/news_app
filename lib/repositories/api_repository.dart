import 'dart:convert';

import 'package:app_for_flutter_test/models/news_item_model.dart';
import 'package:app_for_flutter_test/shared/constants.dart' as Constatns;
import 'package:http/http.dart';

class ApiRepository {
  Future<List<NewsItemModel>> getNews() async {
    final res = await get(Uri.parse(Constatns.newsUrls));

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      final newsList =
          body.map((dynamic item) => NewsItemModel.fromJson(item)).toList();

      return newsList;
    } else {
      throw ("Can't get the news");
    }
  }
}
