import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laptrinhmang/Home/controller.dart';

import '../BottomNavigationBar/index.dart';
import '../global.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Global.typeScreen = TypeScreen.LOGIN;
        return true;
      },
      child: GetBuilder(
          init: HomeController(),
          builder: (controller) {
            return Scaffold(
              bottomNavigationBar: const BottomNavigationBarHome(),
              body: Obx(() => controller.currentPage.value),
            );
          }),
    );
  }
}
