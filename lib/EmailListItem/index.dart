import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:laptrinhmang/Model/email_data.dart';
import 'package:laptrinhmang/styles/svg.dart';
import 'package:laptrinhmang/styles/text_define.dart';
import 'package:intl/intl.dart';
import '../FileView/index.dart';

class EmailListItem extends StatelessWidget {
  final EmailData emailData;
  const EmailListItem({super.key, required this.emailData});

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateFormat('E, d MMM yyyy HH:mm:ss Z')
        .parse(emailData.date)
        .add(const Duration(hours: 7));

    String formattedDate = DateFormat('dd/MM/yyyy HH:mm').format(dateTime);
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                    height: 40, width: 40, child: Image.asset(Picture.avatar))),
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
                              fontSize: 15, fontWeight: FontWeight.w700),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis),
                    ),
                    const SizedBox(width: 2),
                    Text(formattedDate, style: TextDefine.te2_R),
                  ],
                ),
                const SizedBox(height: 4),
                Text(emailData.subject, style: TextDefine.te1_R),
                const SizedBox(height: 4),
                Html(
                    data: emailData.content.length > 40
                        ? emailData.content
                            .replaceAll('\n\n', '\n')
                            .substring(0, 40)
                        : emailData.content),
                Row(
                    children: emailData.file.map((e) {
                  return e.content.isNotEmpty && e.name.isNotEmpty
                      ? Expanded(child: FileView(fileData: e))
                      : const SizedBox();
                }).toList())
              ],
            ))
          ],
        ),
        const Divider()
      ],
    );
  }
}
