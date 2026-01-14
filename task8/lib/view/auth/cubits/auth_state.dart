import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

// Initial state
class AuthInitial extends AuthState {}

// Loading state (for login/register)
class AuthLoading extends AuthState {}

// Success state
class AuthSuccess extends AuthState {
  final String message;
  const AuthSuccess({required this.message});

  @override
  List<Object?> get props => [message];
}

// Failure state
class AuthFailure extends AuthState {
  final String error;
  const AuthFailure({required this.error});

  @override
  List<Object?> get props => [error];
}
