import 'package:equatable/equatable.dart';

class ProfileState extends Equatable {
  final String name;
  final String email;
  final bool isLoading;
  final bool logoutSuccess;
  final String? error;

  const ProfileState({
    this.name = "",
    this.email = "",
    this.isLoading = true,
    this.logoutSuccess = false,
    this.error,
  });

  ProfileState copyWith({
    String? name,
    String? email,
    bool? isLoading,
    bool? logoutSuccess,
    String? error,
  }) {
    return ProfileState(
      name: name ?? this.name,
      email: email ?? this.email,
      isLoading: isLoading ?? this.isLoading,
      logoutSuccess: logoutSuccess ?? this.logoutSuccess,
      error: error,
    );
  }

  @override
  List<Object?> get props => [name, email, isLoading, logoutSuccess, error];
}
