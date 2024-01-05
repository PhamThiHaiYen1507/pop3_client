import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laptrinhmang/InputServer/index.dart';
import 'package:laptrinhmang/global.dart';
import 'package:laptrinhmang/loading_overlay/loading_overlay.dart';

Future<void> main() async {
  await Global.initial();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: LoadingOverlay.instance.navigatorKey,
      home: const InputServer(),
    );
  }
}
