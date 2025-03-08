import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class ProfileRegisterDto {
  String name;
  String email;
  String password;
  String contact;
  ProfileRegisterDto({
    required this.name,
    required this.email,
    required this.password,
    required this.contact,
  });

  factory ProfileRegisterDto.empty() {
    return ProfileRegisterDto(
      name: '',
      email: '',
      password: '',
      contact: '',
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
      'contact': contact,
    };
  }

  factory ProfileRegisterDto.fromMap(Map<String, dynamic> map) {
    return ProfileRegisterDto(
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      contact: map['contact'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileRegisterDto.fromJson(String source) =>
      ProfileRegisterDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProfileRegisterDto(name: $name, email: $email, password: $password, contact: $contact)';
  }
}
