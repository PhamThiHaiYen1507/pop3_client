import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laptrinhmang/Model/file_data.dart';
import 'package:laptrinhmang/global.dart';

import '../HomePage/index.dart';
import '../Model/email_data.dart';
import '../ProfilePage/index.dart';

enum TYPE_HOME { HOME, USER }

class HomeController extends GetxController {
  late final Rx<TYPE_HOME> typeHome;
  late final Rx<Widget> currentPage;

  @override
  void onInit() {
    typeHome = Rx(TYPE_HOME.HOME);
    currentPage = Rx(const SizedBox());
    onChangePage();
    Global.socket?.write('LIST\r\n');

    int i = 0;
    for (i; i < Global.length; i++) {
      Global.socket?.write('RETR ${i + 1}\r\n');
      Global.accountSelected.update((val) {
        val?.emailDataList
            .add(EmailData(i + 1, '', '', '', '', [FileData('', '', '')]));
      });
    }
    super.onInit();
  }

  void onChangePage() {
    switch (typeHome.value) {
      case TYPE_HOME.HOME:
        currentPage.value = const HomePage();
        break;
      case TYPE_HOME.USER:
        currentPage.value = const ProfilePage();
        break;
      default:
    }
  }
}
