library constants;

import 'package:flutter/material.dart';

const int relativeWidth = 414; // iPhone 11 Pro Max screen width
const int relativeHeight = 896; // iPhone 11 Pro Max screen height

const int maxRecentCount = 4;

double rw(BuildContext context) {
  return rwWidth(MediaQuery.of(context).size.width);
}

double rwWidth(double width) {
  return width / relativeWidth;
}

double rh(BuildContext context) {
  return rhHeight(MediaQuery.of(context).size.height);
}

double rhHeight(double height) {
  return height / relativeHeight;
}

const String newsUrls =
    'http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=eb2de51f9cbe45d584190b4b68707c1f';
