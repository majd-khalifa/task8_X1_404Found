import 'package:equatable/equatable.dart';

class ApiResponse<T> extends Equatable {
  final T data;
  final String message;
  final int statusCode;
  final String? token;

  const ApiResponse({
    required this.data,
    required this.message,
    required this.statusCode,
    this.token,
  });

  @override
  List<Object?> get props => [data, message, statusCode, token];
}
