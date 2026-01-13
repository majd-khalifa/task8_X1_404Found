import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int? id;
  final String email;
  final String name;
  final String role;

  const User({
    this.id,
    required this.email,
    required this.name,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'],
    email: json['email'],
    name: json['name'],
    role: json['role'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'email': email,
    'name': name,
    'role': role,
  };

  //*************** */
  User copyWith({int? id, String? email, String? name, String? role}) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      role: role ?? this.role,
    );
  }

  //************* */
  @override
  List<Object?> get props => [id, email, name, role];
}
