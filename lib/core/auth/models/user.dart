// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dalcioteca_mobile/core/auth/models/group.dart';

class User {
  int? id;
  String code;
  String name;
  String email;
  String? password;
  bool status;
  Group group;
  String contact;

  User({
    this.id,
    required this.code,
    required this.name,
    required this.email,
    this.password,
    required this.status,
    required this.group,
    required this.contact,
  });

  factory User.empty() {
    return User(
      code: '',
      name: '',
      email: '',
      contact: '',
      status: true,
      group: Group.empty(),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'code': code,
      'name': name,
      'email': email,
      'password': password,
      'status': status,
      'group': group.toMap(),
      'contact': contact,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] != null ? map['id'] as int : null,
      code: map['code'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] != null ? map['password'] as String : null,
      status: map['status'] as bool,
      group: Group.fromMap(map['group'] as Map<String, dynamic>),
      contact: map['contact'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, code: $code, name: $name, email: $email, password: $password, status: $status, group: $group, contact: $contact)';
  }
}
