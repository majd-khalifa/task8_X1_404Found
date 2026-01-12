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
    email: json['email']?.toString() ?? 'no_email@example.com',
    name: json['name']?.toString() ?? 'Unknown',
    role: json['role']?.toString() ?? 'user',
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'email': email,
    'name': name,
    'role': role,
  };

  @override
  List<Object?> get props => [id, email, name, role];
}
