import 'package:equatable/equatable.dart';

class AppError extends Equatable {
  final String message;
  final String? code;

  const AppError({required this.message, this.code});

  factory AppError.empty() {
    return const AppError(message: '');
  }

  @override
  List<Object?> get props => [message, code];

  @override
  bool get stringify =>
      true; // This is necessary to enable toString() in Equatable

  @override
  String toString() {
    return "Error: $message";
  }
}
