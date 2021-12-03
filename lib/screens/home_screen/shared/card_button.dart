import 'dart:ui';
import 'package:app_for_flutter_test/shared/constants.dart' as Constants;
import 'package:app_for_flutter_test/shared/style.dart';
import 'package:flutter/material.dart';

class CardButton extends StatelessWidget {
  CardButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    double _containerWidth() => MediaQuery.of(context).size.width / 2;
    Widget _icon() {
      return Image.asset(
        'assets/images/read_news_icon.png',
        fit: BoxFit.cover,
      );
    }

    Widget _labelText() {
      return Container(
        margin: EdgeInsets.all(10.0 * Constants.rw(context)),
        alignment: Alignment.bottomCenter,
        child: Text('Read the topical news',
            style: getStyle(
                color: blackColor,
                weight: FontWeight.w700,
                fontSize: 16 * Constants.rh(context))),
      );
    }

    return Center(
        child: InkWell(
            onTap: onTap,
            child: Container(
                width: _containerWidth(),
                height: _containerWidth(),
                margin: EdgeInsets.zero,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    20.0 * Constants.rw(context),
                  ),
                  color: whiteColor,
                ),
                child: Stack(
                    alignment: Alignment.center,
                    children: [_icon(), _labelText()]))));
  }
}
