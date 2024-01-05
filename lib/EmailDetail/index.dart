import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:laptrinhmang/FileView/index.dart';
import 'package:laptrinhmang/Model/email_data.dart';
import 'package:laptrinhmang/styles/text_define.dart';

import '../styles/svg.dart';

class EmailDetail extends StatelessWidget {
  final EmailData emailData;
  const EmailDetail({super.key, required this.emailData});

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateFormat('E, d MMM yyyy HH:mm:ss Z')
        .parse(emailData.date)
        .add(const Duration(hours: 7));

    String formattedDate = DateFormat('dd/MM/yyyy HH:mm').format(dateTime);
    return Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                          height: 60,
                          width: 60,
                          child: Image.asset(Picture.avatar))),
                  const SizedBox(width: 16),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(emailData.from,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w700),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis),
                          ),
                          const SizedBox(width: 8),
                          Text(formattedDate, style: TextDefine.te1_R),
                        ],
                      ),
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
                      return e.content.isNotEmpty && e.name.isNotEmpty
                          ? SizedBox(
                              width: (Get.width - 40) / 2,
                              child: FileView(fileData: e))
                          : const SizedBox();
                    }).toList()),
              ),
              const Divider()
            ],
          ),
        ));
  }
}
