class AppError {
  final String message;
  final String code;

  AppError(this.message, this.code);

  @override
  String toString() {
    return "Error: $message";
  }
}
