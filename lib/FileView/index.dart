import 'package:flutter/material.dart';
import 'package:laptrinhmang/Model/file_data.dart';
import 'package:laptrinhmang/styles/utils.dart';

import '../styles/text_define.dart';

class FileView extends StatelessWidget {
  final FileData fileData;
  const FileView({super.key, required this.fileData});

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
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.all(8),
                  child: Utils.renderIconFromTypeFile(fileData.type)),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    fileData.name,
                    style: TextDefine.t2_B,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ))
            ]));
  }
}
