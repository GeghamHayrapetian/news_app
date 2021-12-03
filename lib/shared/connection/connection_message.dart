import 'package:app_for_flutter_test/shared/constants.dart' as Constants;
import 'package:app_for_flutter_test/shared/style.dart';
import 'package:flutter/material.dart';

class ConnectionMessage {
  OverlayState? overlayState;

  final OverlayEntry overlayEntry = OverlayEntry(builder: (context) {
    return Positioned(
        height: 60 * Constants.rh(context),
        width: MediaQuery.of(context).size.width,
        child: Material(
            child: Container(
          alignment: Alignment.bottomCenter,
          color: carnationColor,
          child: Text(
            'Wifi or mobile data is turned off.',
            style: getStyle(color: whiteColor),
            textAlign: TextAlign.center,
          ),
        )));
  });

  void showOverlay(BuildContext context) {
    overlayState = Overlay.of(context);
    overlayState?.insert(overlayEntry);
  }

  void hideOverlay() {
    overlayState != null ? overlayEntry.remove() : null;
  }
}
