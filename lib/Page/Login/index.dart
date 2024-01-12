import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laptrinhmang/Page/Login/controller.dart';
import 'package:laptrinhmang/widget/Buttom/index.dart';
import 'package:laptrinhmang/widget/CustomTextField/index.dart';
import 'package:laptrinhmang/styles/styles.dart';
import 'package:laptrinhmang/styles/text_define.dart';

import '../../global.dart';

class Login extends StatelessWidget {
  final String username;
  const Login({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Global.typeScreen = TypeScreen.USERNAME;
        return true;
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: GetBuilder<LoginController>(
            init: LoginController(username),
            builder: (controller) {
              return Scaffold(
                body: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(children: [
                    const SizedBox(height: 50),
                    Text('Login with "$username"', style: TextDefine.t1_R),
                    CustomTextField(
                        focusNode: controller.passFocusNode,
                        obscureText: true,
                        controller: controller.pass,
                        hintText: "Password"),
                    const SizedBox(height: 80),
                    Button(onPressed: controller.onConfirm, text: 'Login'),
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
