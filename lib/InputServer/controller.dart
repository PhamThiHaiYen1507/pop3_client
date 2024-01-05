import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laptrinhmang/global.dart';

class InputServerController extends GetxController {
  late final TextEditingController id;
  late final FocusNode idFocus;

  @override
  void onInit() {
    id = TextEditingController(text: '127.0.0.1');
    idFocus = FocusNode();
    super.onInit();
  }

  void onConfirm() {
    idFocus.unfocus();
    if (id.text == '127.0.0.1' || id.text == 'localhost') {
      Global.connect('10.0.2.2');
    } else {
      Global.connect(id.text);
    }
  }

  @override
  void onClose() {
    id.dispose();
    idFocus.dispose();
    super.onClose();
  }
}
