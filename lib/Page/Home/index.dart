import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laptrinhmang/Page/Home/controller.dart';

import '../../widget/BottomNavigationBar/index.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: HomeController(),
        builder: (controller) {
          return Scaffold(
            bottomNavigationBar: const BottomNavigationBarHome(),
            body: Obx(() => controller.currentPage.value),
          );
        });
  }
}
