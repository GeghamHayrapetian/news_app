import 'package:app_for_flutter_test/models/news_item_model.dart';
import 'package:app_for_flutter_test/shared/constants.dart' as Constants;
import 'package:app_for_flutter_test/shared/style.dart';
import 'package:flutter/material.dart';

class NewsItemWidget extends StatelessWidget {
  const NewsItemWidget({required this.item});

  final NewsItemModel item;

  @override
  Widget build(BuildContext context) {
    Widget _renderImage(String? url) {
      if (url != null) {
        return Image.network(
          url,
          fit: BoxFit.cover,
        );
      }
      return Container();
    }

    Widget _renderItemColumn() {
      return Column(
        children: [
          _renderImage(item.urlForDownloadImage),
          Text(
            item.newsSource?.name ?? '',
            style: getStyle(),
          ),
          Text(
            item.newsTitle ?? '',
            style: getStyle(),
          )
        ],
      );
    }

    Widget _renderDecoratedContainer() {
      return Container(
        margin: EdgeInsets.all(15 * Constants.rw(context)),
        padding: EdgeInsets.all(10 * Constants.rw(context)),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10 * Constants.rw(context)),
            boxShadow: [
              BoxShadow(
                color: blackColor,
                blurRadius: 3,
              ),
            ]),
        child: _renderItemColumn(),
      );
    }

    return Padding(
      padding: EdgeInsets.only(top: 10 * Constants.rh(context)),
      child: _renderDecoratedContainer(),
    );
  }
}
