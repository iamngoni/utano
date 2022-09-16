class AppException implements Exception {
  AppException(
    this.message, {
    this.title = 'Something went wrong',
  });
  String title;
  String message;
}
