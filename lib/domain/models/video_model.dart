import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class VideoModel {
  String description;
  String url;
  VideoModel({
    required this.description,
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'description': description,
      'url': url,
    };
  }

  factory VideoModel.fromMap(Map<String, dynamic> map) {
    return VideoModel(
      description: map['description'] as String,
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory VideoModel.fromJson(String source) =>
      VideoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'VideoModel(description: $description, url: $url)';
}
