part of 'file_picker_bloc.dart';

abstract class FilePickerState extends Equatable {
  const FilePickerState();
}

class FilePickerInitial extends FilePickerState {
  @override
  List<Object> get props => [];
}

class FilePickerLoading extends FilePickerState {
  @override
  List<Object> get props => [];
}

class FilePickerFileLoaded extends FilePickerState {
  const FilePickerFileLoaded(this.file);
  final File file;
  @override
  List<Object> get props => [];
}

class FilePickerError extends FilePickerState {
  const FilePickerError(this.error);
  final ApplicationError error;

  @override
  List<Object> get props => [error];
}
