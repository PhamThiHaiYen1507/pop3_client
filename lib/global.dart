import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laptrinhmang/Model/account_data.dart';
import 'package:laptrinhmang/Model/file_data.dart';
import 'package:laptrinhmang/loading_overlay/loading_overlay.dart';
import 'package:laptrinhmang/styles/app_logger.dart';
import 'package:laptrinhmang/styles/svg.dart';
import 'package:laptrinhmang/styles/utils.dart';
import 'package:path_provider/path_provider.dart';

import 'Home/index.dart';
import 'Login/index.dart';
import 'Model/email_data.dart';
import 'Username/index.dart';

// ignore: constant_identifier_names
enum TypeScreen { CONNECT_SERVER, LOGIN, USERNAME, HOME }

class Global {
  static TypeScreen typeScreen = TypeScreen.CONNECT_SERVER;
  static Socket? socket;
  static List<AccountData> accountList = [];
  static bool status = true;
  static Rx<AccountData> accountSelected = Rx(AccountData('', []));
  static num length = 0;
  static int i = 0;

  static Future<void> initial() async {
    WidgetsFlutterBinding.ensureInitialized();
    LoadingOverlay(
        barrierColor: Colors.black26,
        indicator: Image.asset(height: 80, Picture.loading));
    readData();
  }

  static Future<void> readData() async {
    try {
      final directory = await getApplicationDocumentsDirectory();

      File file = File('${directory.path}/account.json');
      if (file.existsSync()) {
        // Read the file
        final contents = await file.readAsString();
        accountList = (jsonDecode(contents) as List)
            .map((e) => AccountData.fromJson(e))
            .toList();
      } else {
        logD('No file');
      }
    } catch (e) {
      logD('Erro: $e');
    }
  }

  static void writeJsonToFile() async {
    try {
      String jsonString = jsonEncode(accountList);

      final directory = await getApplicationDocumentsDirectory();

      File file = File('${directory.path}/account.json');

      if (!file.existsSync()) {
        file.createSync(recursive: true); // Tạo file nếu chưa tồn tại
      }
      await file.writeAsString('$jsonString\n');
    } catch (e) {
      logD('Erro: $e');
    }
  }

  Future<String> _createFileFromString(String encodedStr, String name) async {
    Uint8List bytes = base64.decode(encodedStr);
    String dir = (await getApplicationDocumentsDirectory()).path;
    String fullPath = '$dir/name';
    print("local file full path $fullPath");
    File file = File(fullPath);
    await file.writeAsBytes(bytes);
    print(file.path);

    return file.path;
  }

  static Future<void> connect(String id) async {
    LoadingOverlay.show();
    await Future.delayed(const Duration(seconds: 2));
    try {
      socket = await Socket.connect(id, 110);
      socket?.listen(
        (Uint8List data) {
          String response;
          try {
            response = utf8.decode(data);
          } catch (e) {
            response = '';
          }
          logD(response);
          if (typeScreen == TypeScreen.CONNECT_SERVER) {
            if (response.startsWith("+OK")) {
              Utils.showNotification(
                  NOTIFICATION_TYPE.SUCCESS, 'Connect POP3 Server', response);
              typeScreen = TypeScreen.USERNAME;
              Get.to(() => const Username());
            } else {
              Utils.showNotification(
                  NOTIFICATION_TYPE.ERROR, 'Connect POP3 Server', response);
            }
          } else if (typeScreen == TypeScreen.LOGIN) {
            if (response.startsWith("+OK")) {
              Utils.showNotification(
                  NOTIFICATION_TYPE.SUCCESS, 'Login', response);

              typeScreen = TypeScreen.HOME;
              RegExp regExp = RegExp(r'\d+');
              Iterable<Match> matches = regExp.allMatches(response);
              length =
                  matches.isEmpty ? 0 : int.parse(matches.first.group(0) ?? '');
              List<EmailData> elementsToAdd = [];

              accountList
                  .firstWhereOrNull((element) =>
                      element.username == accountSelected.value.username)
                  ?.emailDataList
                  .forEach((element) {
                elementsToAdd.add(element);
              });

              accountSelected.update((val) {
                val?.emailDataList.addAll(elementsToAdd);
              });
              Get.offAll(() => const Home());
            } else {
              Get.back();
              Utils.showNotification(
                  NOTIFICATION_TYPE.ERROR, 'Login', response);
              typeScreen = TypeScreen.USERNAME;
            }
          } else if (typeScreen == TypeScreen.USERNAME) {
            if (response.startsWith("+OK")) {
              Utils.showNotification(
                  NOTIFICATION_TYPE.SUCCESS, 'Input username', response);
              typeScreen = TypeScreen.LOGIN;

              Get.to(() => Login(username: accountSelected.value.username));
            } else {
              Utils.showNotification(
                  NOTIFICATION_TYPE.ERROR, 'Input username', response);
            }
          } else if (typeScreen == TypeScreen.HOME) {
            String from = '';
            String subject = '';
            String date = '';
            String textContent = '';
            String htmlContent = getContentHtml(response);
            List<FileData> file = [FileData('', '', '')];
            String currentContentType = '';
            bool text = true;
            if (response.isNotEmpty) {
              List<String> parts = response.contains('------')
                  ? response.substring(0, response.indexOf('-----')).split('\n')
                  : response.split('\n');
              for (String part in parts) {
                if (part.contains('From:')) {
                  from = part.substring('From: '.length).trim();
                } else if (part.contains('Subject:')) {
                  subject = part.substring('Subject: '.length).trim();
                } else if (part.contains('Date:')) {
                  date = part.substring('Date: '.length).trim();
                }
              }
              List<String> partContent = response.contains('------')
                  ? response
                      .substring(response.indexOf('------'))
                      .split('------')
                  : response.split('------');
              for (String part in partContent) {
                if (part.contains('Content-Type: ')) {
                  currentContentType = part
                      .substring(part.indexOf('Content-Type: '))
                      .split(';')[0]
                      .replaceAll('Content-Type: ', '');
                }
                if (part.isNotEmpty) {
                  String data = part.contains('\r\n\r\n')
                      ? part.substring(part.indexOf('\r\n\r\n')).trim()
                      : '';
                  String name = part.contains('filename=')
                      ? part.substring(part.indexOf('filename=')).contains('\n')
                          ? part
                              .substring(part.indexOf('filename='))
                              .substring(0, part.indexOf('\n'))
                              .replaceAll('filename=', '')
                              .trim()
                          : ''
                      : '';
                  logD(data);

                  switch (currentContentType) {
                    case 'text/plain':
                      if (text) {
                        textContent = data;
                        text = false;
                      } else {
                        file.add(FileData('text/plain', data, name));
                      }
                      break;
                    case 'text/html':
                      htmlContent = data;
                      break;
                    case 'image/jpeg':
                      file.add(FileData('image/jpeg', data, name));
                      break;
                    case 'application/pdf':
                      file.add(FileData('application/pdf', data, name));
                      break;
                    default:
                      break;
                  }
                }
              }
            }

            EmailData data =
                EmailData(0, '', '', '', '', [FileData('', '', '')]);
            data.from = from;
            data.date = date;
            data.content = htmlContent.isNotEmpty ? htmlContent : textContent;
            data.subject = subject;
            data.file = file;
            accountSelected.update((val) {
              val?.emailDataList.removeWhere((element) => element.id == i + 1);
            });
            accountSelected.update((val) {
              val?.emailDataList.add(data);
            });
            i++;
            if (accountList.firstWhereOrNull((element) =>
                    element.username == accountSelected.value.username) ==
                null) {
              accountList.add(accountSelected.value);
            } else {
              accountList.remove(accountList.firstWhereOrNull((element) =>
                  element.username == accountSelected.value.username));
              accountList.add(accountSelected.value);
            }
            writeJsonToFile();
          }
        },
        // onDone: () {
        //   socket?.destroy();
        //   Utils.showNotification(NOTIFICATION_TYPE.ERROR, 'Connect POP3 Server',
        //       'Connection closed by server');
        // },
        onError: (error) {
          socket?.destroy();
          Utils.showNotification(
              NOTIFICATION_TYPE.ERROR, 'Connect POP3 Server', 'Error: $error');
        },
      );
    } catch (e) {
      Utils.showNotification(
          NOTIFICATION_TYPE.ERROR, 'Connect POP3 Server', 'Connect fail');
    }
    LoadingOverlay.close();
  }

  static String getContentHtml(String response) {
    int startIndex = response.indexOf('<html>');
    if (startIndex != -1) {
      int endIndex = response.indexOf('</html>', startIndex);
      if (endIndex != -1) {
        String extractedText =
            response.substring(startIndex, endIndex + '</html>'.length);
        return extractedText;
      }
    }
    return '';
  }

  static String getContent(String response) {
    int startIndex = response.indexOf('<html>');
    if (startIndex != -1) {
      int endIndex = response.indexOf('</html>', startIndex);
      if (endIndex != -1) {
        String extractedText =
            response.substring(startIndex, endIndex + '</html>'.length);
        return extractedText;
      }
    }
    return '';
  }
}
