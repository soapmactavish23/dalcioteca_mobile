import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class FileModel {
  int? id;
  String type;
  String name;
  double size;
  String url;
  FileModel({
    this.id,
    required this.type,
    required this.name,
    required this.size,
    required this.url,
  });

  factory FileModel.empty() {
    return FileModel(id: null, type: '', name: '', size: 0, url: '');
  }
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'type': type,
      'name': name,
      'size': size,
      'url': url,
    };
  }

  factory FileModel.fromMap(Map<String, dynamic> map) {
    return FileModel(
      id: map['id'] != null ? map['id'] as int : null,
      type: map['type'] as String,
      name: map['name'] as String,
      size: map['size'] as double,
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory FileModel.fromJson(String source) => FileModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FileModel(id: $id, type: $type, name: $name, size: $size, url: $url)';
  }
}
