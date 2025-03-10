// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dalcioteca_mobile/domain/models/category_model.dart';
import 'package:dalcioteca_mobile/domain/models/video_model.dart';

class MaterialModel {
  int? id;
  String name;
  String description;
  String? url;
  CategoryModel categoryModel;
  List<VideoModel> videos;

  MaterialModel({
    this.id,
    required this.name,
    required this.description,
    this.url,
    required this.categoryModel,
    required this.videos,
  });

  factory MaterialModel.empty() {
    return MaterialModel(
      id: null,
      name: '',
      description: '',
      url: null,
      categoryModel: CategoryModel.empty(),
      videos: [],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'url': url,
      'categoryModel': categoryModel.toMap(),
      'videos': videos.map((x) => x.toMap()).toList(),
    };
  }

  factory MaterialModel.fromMap(Map<String, dynamic> map) {
    return MaterialModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] as String,
      description: map['description'] as String,
      url: map['url'] != null ? map['url'] as String : null,
      categoryModel:
          CategoryModel.fromMap(map['category'] as Map<String, dynamic>),
      videos: List<VideoModel>.from(
        (map['videos'] as List<dynamic>).map<VideoModel>(
          (x) => VideoModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory MaterialModel.fromJson(String source) =>
      MaterialModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MaterialModel(id: $id, name: $name, description: $description, url: $url, categoryModel: $categoryModel, videos: $videos)';
  }
}
