class FileData {
  late String type;
  late String content;
  late String name;

  FileData(this.type, this.content, this.name);

  FileData.fromJson(Map<dynamic, dynamic> json) {
    type = json['type'] ?? '';
    content = json['content'] ?? '';
    name = json['name'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['content'] = content;
    data['name'] = name;
    return data;
  }
}
