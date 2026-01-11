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

  @override
  List<Object?> get props => [id, email, name, role];
}
