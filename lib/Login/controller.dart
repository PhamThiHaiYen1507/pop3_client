import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  late final TextEditingController userName;
  late final TextEditingController pass;
  Socket? socket;
  @override
  void onInit() {
    connect();
    userName = TextEditingController(text: 'demo@localhost.com');
    pass = TextEditingController(text: 'haiyen');
    super.onInit();
  }

  void onConfirm() {
    socket?.write('USER ${userName.text}\r\n');
    socket?.write('PASS ${pass.text}');
  }

  void connect() async {
    socket = await Socket.connect('10.0.2.2', 110);

    socket?.listen(
      (Uint8List data) {
        String response = utf8.decode(data);
        print('Received: $response');
      },
      onDone: () {
        print('Connection closed by server');
        socket?.destroy();
      },
      onError: (error) {
        print('Error: $error');
        socket?.destroy();
      },
    );
  }

  @override
  void onClose() {
    userName.dispose();
    pass.dispose();
    super.onClose();
  }

  // Future<String> get _localPath async {
  //   final directory = await getApplicationDocumentsDirectory();

  //   return directory.path;
  // }

  // Future<File> get _localFile async {
  //   final path = await _localPath;
  //   return File('$path/counter.txt');
  // }

  // Future<File> writeCounter(int counter) async {
  //   final file = await _localFile;

  //   // Write the file
  //   return file.writeAsString('$counter');
  // }
}
