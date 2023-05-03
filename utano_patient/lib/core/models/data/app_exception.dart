class AppException implements Exception {
  AppException(
    this.message, {
    this.title = "Hey, it's not your fault",
  });

  factory AppException.unknown() {
    return AppException(
      'Unknown error occurred',
      title: 'Oops!',
    );
  }

  String title;
  String message;

  @override
  String toString() => 'AppException(title: $title, message: $message)';
}
