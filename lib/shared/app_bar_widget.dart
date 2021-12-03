import 'package:app_for_flutter_test/shared/constants.dart' as Constants;
import 'package:app_for_flutter_test/shared/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    this.titleText = '',
  });
  final String titleText;

  @override
  Widget build(BuildContext context) {
    Widget _renderPrefix() {
      return Positioned(
          left: 20 * Constants.rw(context),
          child: Container(
            alignment: Alignment.center,
            child: Center(
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  CupertinoIcons.back,
                  color: blackColor,
                  size: 30 * Constants.rh(context),
                ),
              ),
            ),
          ));
    }

    Widget _renderTitle() {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 15 * Constants.rh(context)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              titleText,
              style: getStyle(
                weight: FontWeight.w700,
                color: blackColor,
                fontSize: 20,
              ),
            )
          ],
        ),
      );
    }

    return Stack(
      alignment: Alignment.center,
      children: [
        _renderPrefix(),
        _renderTitle(),
      ],
    );
  }
}
