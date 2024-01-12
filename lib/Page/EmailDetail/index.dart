import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:laptrinhmang/Model/email_data.dart';
import 'package:laptrinhmang/global.dart';
import 'package:laptrinhmang/styles/text_define.dart';

import '../../widget/FileView/index.dart';
import '../../styles/svg.dart';

class EmailDetail extends StatelessWidget {
  final EmailData emailData;
  const EmailDetail({super.key, required this.emailData});

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateFormat('E, d MMM yyyy HH:mm:ss Z')
        .parse(emailData.date)
        .add(const Duration(hours: 7));

    String formattedDate = DateFormat('dd/MM/yyyy HH:mm').format(dateTime);
    emailData.file.removeWhere((element) => element.content.isEmpty);
    return Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(emailData.subject, style: TextDefine.t1_R),
              const SizedBox(height: 32),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                      clipBehavior: Clip.antiAlias,
                      borderRadius: BorderRadius.circular(16),
                      child: SizedBox(
                          height: 80,
                          width: 80,
                          child: Image.asset(Picture.avatar))),
                  const SizedBox(width: 16),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        emailData.from,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 8),
                      Text(formattedDate, style: TextDefine.te1_R),
                      const SizedBox(height: 8),
                      const Text('To me', style: TextDefine.te1_R),
                    ],
                  ))
                ],
              ),
              const SizedBox(height: 16),
              Html(data: emailData.content),
              SizedBox(
                height: 60,
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: emailData.file.map((e) {
                      return e.content.isNotEmpty &&
                              e.name.isNotEmpty &&
                              (e.type != 'image/png' && e.type != 'image/jpeg')
                          ? SizedBox(
                              width: (Get.width - 40) / 2,
                              child: FileView(fileData: e, isDowwnload: true))
                          : const SizedBox();
                    }).toList()),
              ),
              if (emailData.file
                  .where((element) =>
                      element.type == 'image/png' ||
                      element.type == 'image/jpeg')
                  .isNotEmpty)
                ...emailData.file
                    .where((element) =>
                        (element.type == 'image/png' ||
                            element.type == 'image/jpeg') &&
                        element.name.isNotEmpty)
                    .map(
                  (e) {
                    Uint8List data;
                    try {
                      data = base64Decode(
                          e.content.replaceAll('\r', '').replaceAll('\n', ''));
                    } catch (e) {
                      data = Uint8List(0);
                    }
                    return Stack(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.memory(data,
                                gaplessPlayback: true,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    Image.asset(Picture.avatar))),
                        Positioned(
                          top: 20,
                          right: 20,
                          child: InkWell(
                            onTap: () {
                              Global.createFileFromString(
                                  e.content
                                      .trim()
                                      .replaceAll('\r', '')
                                      .replaceAll('\n', '')
                                      .trim(),
                                  e.name);
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.download_for_offline_sharp),
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ).toList(),
              const Divider()
            ],
          ),
        ));
  }
}
