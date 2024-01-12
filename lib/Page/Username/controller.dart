import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laptrinhmang/Model/account_data.dart';

import '../../global.dart';

class UsernameController extends GetxController {
  late final TextEditingController userName;
  @override
  void onInit() {
    userName = TextEditingController(text: 'demo2');
    super.onInit();
  }

  void onConfirm() {
    Global.socket?.write('USER ${userName.text}\r\n');
    Global.accountSelected.value = AccountData(userName.text, []); 
  }

  @override
  void onClose() {
    userName.dispose();
    super.onClose();
  }
}
