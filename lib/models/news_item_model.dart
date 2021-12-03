import 'source_model.dart';

class NewsItemModel {
  NewsItemModel({
    this.newsSource,
    this.newsTitle,
    this.urlForDownloadImage,
  });

  /// Return the news model from json
  factory NewsItemModel.fromJson(Map<String, dynamic> json) {
    return NewsItemModel(
      newsSource: Source.fromJson(json['source']),
      newsTitle: json['title'] as String,
      urlForDownloadImage: json['urlToImage'] as String,
    );
  }
  final Source? newsSource;

  final String? newsTitle;
  final String? urlForDownloadImage;
}
