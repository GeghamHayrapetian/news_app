import 'dart:async';

import 'package:app_for_flutter_test/screens/home_screen/shared/card_button.dart';
import 'package:app_for_flutter_test/screens/home_screen/shared/top_area.dart';
import 'package:app_for_flutter_test/screens/news_screen/news_bloc/news_bloc.dart';
import 'package:app_for_flutter_test/screens/news_screen/news_bloc/news_event.dart';
import 'package:app_for_flutter_test/screens/news_screen/news_screen.dart';
import 'package:app_for_flutter_test/shared/connection/connection_message.dart';
import 'package:app_for_flutter_test/shared/style.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  final ConnectionMessage connectionMessage = ConnectionMessage();
  late NewsBloc _newsBloc;

  @override
  void initState() {
    super.initState();
    _initConnectivity();
    _connectivitySubscribe();
    _newsBloc = NewsBloc();
  }

  @override
  void dispose() {
    _dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(value: _newsBloc, child: _render());
  }

  Widget _render() {
    return Scaffold(
      backgroundColor: alabasterColor,
      body: _renderFieldOnScreen(),
    );
  }

  Widget _renderFieldOnScreen() {
    return SafeArea(
        child: Stack(
      children: [
        TopArea(),
        CardButton(
          onTap: _onTapNewsButton,
        ),
      ],
    ));
  }

  void _connectivitySubscribe() {
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> _initConnectivity() async {
    late ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      throw Exception(e.toString());
    }
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  void _updateConnectionStatus(ConnectivityResult result) {
    _connectionStatus = result;
    if (_connectionStatus == ConnectivityResult.none) {
      connectionMessage.showOverlay(context);
    } else {
      connectionMessage.hideOverlay();
    }
  }

  void _dispose() {
    _connectivitySubscription.cancel();
    _newsBloc.close();
  }

  void _onTapNewsButton() {
    _newsBloc.add(LoadNewsEvent());
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                BlocProvider.value(value: _newsBloc, child: NewsScreen())));
  }
}
