import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laptrinhmang/page/Username/controller.dart';
import 'package:laptrinhmang/global.dart';

import '../../widget/Buttom/index.dart';
import '../../widget/CustomTextField/index.dart';
import '../../styles/styles.dart';
import '../../styles/text_define.dart';

class Username extends StatelessWidget {
  const Username({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Global.typeScreen = TypeScreen.CONNECT_SERVER;
        return true;
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: GetBuilder<UsernameController>(
            init: UsernameController(),
            builder: (controller) {
              return Scaffold(
                body: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(children: [
                    const SizedBox(height: 50),
                    CustomTextField(
                        controller: controller.userName, hintText: "Username"),
                    const SizedBox(height: 80),
                    Button(onPressed: controller.onConfirm, text: 'Tiếp theo'),
                  ]),
                ),
                appBar: AppBar(
                    backgroundColor: Colors.white,
                    centerTitle: true,
                    title: Text("Login",
                        style: TextDefine.t1_R.copyWith(color: neutral00))),
              );
            }),
      ),
    );
  }
}
