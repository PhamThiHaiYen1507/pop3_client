import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laptrinhmang/styles/text_define.dart';

import '../../widget/Buttom/index.dart';
import '../../widget/CustomTextField/index.dart';
import 'controller.dart';

class InputServer extends StatelessWidget {
  const InputServer({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InputServerController>(
        init: InputServerController(),
        builder: (controller) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            child: Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 80),
                    const Center(
                      child: Text('Welcome Pop3 Client',
                          style: TextDefine.h1_B, textAlign: TextAlign.center),
                    ),
                    const SizedBox(height: 100),
                    const Text('Enter the server ID you want to connect',
                        style: TextDefine.t2_R),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: CustomTextField(
                          controller: controller.id,
                          focusNode: controller.idFocus),
                    ),
                    const SizedBox(height: 80),
                    Button(onPressed: controller.onConfirm, text: 'Connect'),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
