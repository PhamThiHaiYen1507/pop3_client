import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laptrinhmang/global.dart';

class LoginController extends GetxController {
  late final TextEditingController pass;
  late final FocusNode passFocusNode;
  final String username;

  LoginController(this.username);
  @override
  void onInit() {
    pass = TextEditingController(text: 'haiyen');
    passFocusNode = FocusNode();
    super.onInit();
  }

  void onConfirm() {
    passFocusNode.unfocus();
    Global.socket?.write('PASS ${pass.text}\r\n');
  }

  @override
  void onClose() {
    passFocusNode.dispose();
    pass.dispose();
    super.onClose();
  }
}
