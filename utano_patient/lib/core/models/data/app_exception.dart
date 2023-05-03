class AppException implements Exception {
  AppException(
    this.message, {
    this.title = "Hey, it's not your fault",
  });
  String title;
  String message;

  @override
  String toString() => 'AppException(title: $title, message: $message)';
}
