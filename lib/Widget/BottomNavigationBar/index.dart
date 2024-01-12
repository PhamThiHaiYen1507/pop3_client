import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laptrinhmang/Page/Home/controller.dart';

import '../../styles/styles.dart';
import '../../styles/text_define.dart';

class ItemData {
  final IconData icon;
  final String text;
  final String routes;
  final TYPE_HOME type_home;

  ItemData(this.icon, this.text, this.type_home, this.routes);
}

List<ItemData> itemDataList = [
  ItemData(Icons.home, 'Home', TYPE_HOME.HOME, '/home'),
  ItemData(Icons.account_circle, 'Profile', TYPE_HOME.USER, '/profile')
];

class BottomNavigationBarHome extends StatelessWidget {
  const BottomNavigationBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(32), topRight: Radius.circular(32)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: neutral07.withOpacity(0.5),
            blurRadius: 8,
            offset: const Offset(2, -2),
          )
        ],
      ),
      child: SafeArea(
        child: SizedBox(
          height: kBottomNavigationBarHeight,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: itemDataList
                  .map((e) => InkWell(
                      onTap: () {
                        homeController.typeHome.value = e.type_home;
                        homeController.onChangePage();
                      },
                      child:
                          Obx(() => _item(e, homeController.typeHome.value))))
                  .toList()),
        ),
      ),
    );
  }
}

Widget _item(ItemData itemData, TYPE_HOME currentTypeHome) {
  final size = Get.size;
  return SizedBox(
    width: currentTypeHome == itemData.type_home
        ? size.width * 0.3
        : size.width * 0.19,
    child: currentTypeHome == itemData.type_home
        ? Stack(
            children: [
              Container(
                alignment: Alignment.centerRight,
                height: 40,
                decoration: BoxDecoration(
                    color: neutral04.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    const SizedBox(width: 50),
                    Text(
                      itemData.text,
                      style: TextDefine.t2_B,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: size.width * 0.1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: neutral00,
                  ),
                  child: Icon(
                    itemData.icon,
                    size: 30,
                    color: neutral10,
                  ),
                ),
              )
            ],
          )
        : Icon(
            itemData.icon,
            size: 30,
            color: neutral00,
          ),
  );
}
