import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laptrinhmang/styles/text_define.dart';

import '../../widget/EmailListItem/index.dart';
import '../../global.dart';
import '../EmailDetail/index.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Obx(() {
        return Global.accountSelected.value.emailDataList.isNotEmpty
            ? ListView(
                children: Global.accountSelected.value.emailDataList.reversed
                    .map((e) => InkWell(
                          onTap: () => Get.to(() => EmailDetail(emailData: e)),
                          child: EmailListItem(
                            emailData: e,
                          ),
                        ))
                    .toList())
            : const Center(child: Text('No data', style: TextDefine.t1_R));
      }),
    );
  }
}
