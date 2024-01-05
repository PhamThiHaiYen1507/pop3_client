import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laptrinhmang/EmailDetail/index.dart';

import '../EmailListItem/index.dart';
import '../global.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Obx(() {
        Global.accountSelected.update((val) {
          val?.emailDataList.removeWhere((element) => element.from.isEmpty);
        });
        return ListView(
            children: Global.accountSelected.value.emailDataList.reversed
                .map((e) => InkWell(
                      onTap: () => Get.to(() => EmailDetail(emailData: e)),
                      child: EmailListItem(
                        emailData: e,
                      ),
                    ))
                .toList());
      }),
    );
  }
}
