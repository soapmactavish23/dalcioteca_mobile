import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Token {
  String accessToken;
  int expiresIn;
  String refreshToken;
  Token({
    required this.accessToken,
    required this.expiresIn,
    required this.refreshToken,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'accessToken': accessToken,
      'expiresIn': expiresIn,
      'refreshToken': refreshToken,
    };
  }

  factory Token.fromMap(Map<String, dynamic> map) {
    return Token(
      accessToken: map['accessToken'] as String,
      expiresIn: map['expiresIn'] as int,
      refreshToken: map['refreshToken'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Token.fromJson(String source) =>
      Token.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Token(accessToken: $accessToken, expiresIn: $expiresIn, refreshToken: $refreshToken)';
}
