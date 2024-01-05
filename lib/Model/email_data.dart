import 'file_data.dart';

class EmailData {
  late num id;
  late String subject;
  late String from;
  late String content;
  late String date;
  late List<FileData> file;

  EmailData(
      this.id, this.subject, this.from, this.content, this.date, this.file);

  EmailData.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'] ?? 0;
    subject = json['subject'] ?? '';
    from = json['from'] ?? '';
    content = json['content'] ?? '';
    date = json['date'] ?? '';
    file = (json['file'] as List).map((e) => FileData.fromJson(e)).toList();
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['id'] = id;
    data['subject'] = subject;
    data['from'] = from;
    data['content'] = content;
    data['date'] = date;
    data['file'] = file;
    return data;
  }
}
