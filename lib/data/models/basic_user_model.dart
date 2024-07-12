// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BasicUserModel {
  String username;
  String password;
  String email;
  BasicUserModel({
    required this.username,
    required this.password,
    required this.email,
  });

  BasicUserModel copyWith({
    String? username,
    String? password,
    String? email,
  }) {
    return BasicUserModel(
      username: username ?? this.username,
      password: password ?? this.password,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'password': password,
      'email': email,
    };
  }

  factory BasicUserModel.fromMap(Map<String, dynamic> map) {
    return BasicUserModel(
      username: map['username'] as String,
      password: map['password'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BasicUserModel.fromJson(String source) =>
      BasicUserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'BasicUserModel(username: $username, password: $password, email: $email)';

  @override
  bool operator ==(covariant BasicUserModel other) {
    if (identical(this, other)) return true;

    return other.username == username &&
        other.password == password &&
        other.email == email;
  }

  @override
  int get hashCode => username.hashCode ^ password.hashCode ^ email.hashCode;
}
