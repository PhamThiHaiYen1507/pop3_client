import 'package:flutter/material.dart';
import 'package:laptrinhmang/Model/file_data.dart';
import 'package:laptrinhmang/global.dart';
import 'package:laptrinhmang/styles/utils.dart';

import '../styles/text_define.dart';

class FileView extends StatelessWidget {
  final FileData fileData;
  final bool? isDowwnload;
  const FileView({super.key, required this.fileData, this.isDowwnload});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(
              padding: const EdgeInsets.all(8),
              child: Utils.renderIconFromTypeFile(fileData.type)),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                fileData.name,
                style: TextDefine.t2_B,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          )),
          if (isDowwnload == true)
            InkWell(
              onTap: () {
                Global.createFileFromString(
                    fileData.content
                        .trim()
                        .replaceAll('\r', '')
                        .replaceAll('\n', ''),
                    fileData.name);
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.download_for_offline_sharp),
              ),
            )
        ]));
  }
}
