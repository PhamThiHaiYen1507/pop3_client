import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laptrinhmang/CustomTextField/index.dart';
import 'package:laptrinhmang/Login/controller.dart';
import 'package:laptrinhmang/styles/styles.dart';
import 'package:laptrinhmang/styles/text_define.dart';

import '../Buttom/index.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: GetBuilder<LoginController>(
          init: LoginController(),
          builder: (controller) {
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(children: [
                  CustomTextField(
                      controller: controller.userName, hintText: "Username"),
                  const SizedBox(height: 20),
                  CustomTextField(
                      obscureText: true,
                      controller: controller.pass,
                      hintText: "Password"),
                  const SizedBox(height: 50),
                  Button(onPressed: controller.onConfirm, text: 'Đăng nhập'),
                ]),
              ),
              appBar: AppBar(
                  backgroundColor: Colors.white,
                  centerTitle: true,
                  title: Text("Đăng nhập",
                      style: TextDefine.t1_R.copyWith(color: neutral00))),
            );
          }),
    );
  }
}
