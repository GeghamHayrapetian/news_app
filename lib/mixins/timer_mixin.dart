import 'dart:async';
import 'package:flutter/material.dart';

mixin TimerMixin<T extends StatefulWidget> on State<T> {
  Timer startTimer(VoidCallback function) {
    const fourSeconds = const Duration(seconds: 2);
    return Timer.periodic(fourSeconds, (Timer timer) {
      function();
    });
  }
}
