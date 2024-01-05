import 'package:flutter/material.dart';

import '../styles/svg.dart';

class LoadingOverlay {
  final Widget? indicator;
  final Color? barrierColor;

  static LoadingOverlay? _instance;
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static LoadingOverlay get instance => _instance ?? LoadingOverlay();
  bool _show = false;

  factory LoadingOverlay({Widget? indicator, Color? barrierColor}) {
    _instance ??= LoadingOverlay._internal(indicator, barrierColor);
    return _instance ??
        LoadingOverlay(
            barrierColor: Colors.black26,
            indicator: Image.asset(height: 80, Picture.loading));
  }

  LoadingOverlay._internal(this.indicator, this.barrierColor);

  static Future<void> show() async {
    final context = _instance?.navigatorKey.currentState?.overlay?.context;

    if (_instance != null && context != null && !_instance!._show) {
      _instance!._show = true;
      showDialog(
        barrierDismissible: false,
        barrierColor: _instance!.barrierColor,
        context: context,
        builder: (ctx) => WillPopScope(
            child: Center(
              child: _instance!.indicator ?? const SizedBox(),
            ),
            onWillPop: () async => false),
      ).then((value) => _instance!._show = false);
    }
  }

  static void close() {
    final context = _instance?.navigatorKey.currentState?.overlay?.context;
    if (_instance != null && context != null && _instance!._show) {
      Navigator.pop(context);
    }
  }

  static Future<T> load<T>(Future<T> callback) async {
    FocusManager.instance.primaryFocus?.unfocus();
    show();
    final T data = await callback;
    close();

    return data;
  }
}
