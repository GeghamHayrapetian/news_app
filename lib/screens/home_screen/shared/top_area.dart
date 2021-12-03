import 'dart:async';

import 'package:app_for_flutter_test/mixins/timer_mixin.dart';
import 'package:app_for_flutter_test/shared/constants.dart' as constants;
import 'package:app_for_flutter_test/shared/style.dart';
import 'package:flutter/material.dart';

class TopArea extends StatefulWidget {
  @override
  _TopAreaState createState() => _TopAreaState();
}

class _TopAreaState extends State<TopArea> with TimerMixin {
  final PageController _pageController = PageController();
  final ValueNotifier<int> _currentPageNotifier = ValueNotifier(0);
  double get _height => MediaQuery.of(context).size.height;
  Timer? timer;
  @override
  void initState() {
    super.initState();
    timer = startTimer(() {
      _currentPageNotifier.value = ++_currentPageNotifier.value % 3;

      _pageController.animateToPage(_currentPageNotifier.value,
          duration: Duration(milliseconds: 300), curve: Curves.easeInOutCirc);
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _currentPageNotifier.dispose();
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Radius _radius() => Radius.circular(20.0 * constants.rw(context));
    Widget _text() => Text(
          'Topical news here',
          textAlign: TextAlign.center,
          style: getStyle(
              color: codGrayColor,
              weight: FontWeight.w700,
              fontSize: 35 * constants.rh(context)),
        );
    return Container(
        height: _height / 3,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius:
              BorderRadius.only(bottomRight: _radius(), bottomLeft: _radius()),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20 * constants.rw(context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _text(),
              _renderImageList(),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, _renderDots))
            ],
          ),
        ));
  }

  Widget _renderImageList() {
    return Flexible(
        child: Padding(
      padding: EdgeInsets.only(bottom: 15 * constants.rh(context)),
      child: PageView.builder(
        controller: _pageController,
        itemBuilder: _renderItem,
        itemCount: 3,
      ),
    ));
  }

  Widget _renderItem(context, position) {
    return Container(
      child: Image(
        image: AssetImage(
          'assets/images/' + _imagePath(position),
        ),
        width: double.infinity,
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _renderDot(int index) {
    return ValueListenableBuilder(
      valueListenable: _currentPageNotifier,
      builder: (context, currentPage, child) {
        return Container(
          margin: EdgeInsets.only(right: 5, bottom: 15),
          alignment: Alignment.center,
          height: 5,
          width: 5,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: index == currentPage ? blackColor : silverColor),
        );
      },
    );
  }

  Widget _renderDots(index) {
    return _renderDot(index);
  }

  String _imagePath(int index) {
    switch (index) {
      case 0:
        return 'news1.png';
      case 1:
        return 'news2.png';
      case 2:
        return 'news3.png';
      default:
        return '';
    }
  }
}
