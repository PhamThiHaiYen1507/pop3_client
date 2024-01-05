import 'package:laptrinhmang/Model/email_data.dart';

class AccountData {
  late String username;
  late List<EmailData> emailDataList = [];

  AccountData(this.username, this.emailDataList);

  AccountData.fromJson(Map<dynamic, dynamic> json) {
    username = json['username'] ?? '';
    emailDataList = (json['emailDataList'] as List)
        .map((e) => EmailData.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['emailDataList'] = emailDataList;
    return data;
  }
}
