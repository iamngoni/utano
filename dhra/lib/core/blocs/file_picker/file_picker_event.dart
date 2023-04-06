part of 'file_picker_bloc.dart';

abstract class FilePickerEvent extends Equatable {
  const FilePickerEvent();
}

class PickFile extends FilePickerEvent {
  const PickFile(this.fileType);
  final FileType fileType;
  @override
  List<Object> get props => [fileType];
}
