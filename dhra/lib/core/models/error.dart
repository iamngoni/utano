/*
    @Project: dhra
    @Date: 16, September, 2022
    @Author: Ngonidzashe Mangudya

    Copyright (c) 2022 ModestNerd
*/

/// Error
///
/// Main exception implementation for all exceptions
/// that will be thrown within the application
class Error implements Exception {
  Error(this.message, {this.title = "Something went wrong"});
  final String message;
  final String title;
}
