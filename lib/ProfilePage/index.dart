import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laptrinhmang/Buttom/index.dart';
import 'package:laptrinhmang/Home/controller.dart';
import 'package:laptrinhmang/InputServer/index.dart';
import 'package:laptrinhmang/global.dart';
import 'package:laptrinhmang/styles/text_define.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController h = Get.find();

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Text('Selected account',
                    style: TextDefine.h1_B
                        .copyWith(fontWeight: FontWeight.w500, fontSize: 20)),
                const SizedBox(height: 20),
                ...Global.accountList.reversed
                    .map((e) => InkWell(
                          onTap: () {
                            Global.accountSelected(e);
                            h.typeHome.value = TYPE_HOME.HOME;
                            h.onChangePage();
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      const Icon(Icons.account_circle,
                                          size: 40),
                                      const SizedBox(width: 4),
                                      Text(e.username, style: TextDefine.t2_R)
                                    ],
                                  ),
                                ),
                                if (e.username ==
                                    Global.accountSelected.value.username)
                                  const Icon(Icons.done)
                              ],
                            ),
                          ),
                        ))
                    .toList()
              ],
            ),
          ),
          Button(
              onPressed: () {
                Global.socket?.close();
                Global.typeScreen = TypeScreen.CONNECT_SERVER;
                Get.offAll(const InputServer());
              },
              text: 'Log out')
        ],
      ),
    );
  }
}
