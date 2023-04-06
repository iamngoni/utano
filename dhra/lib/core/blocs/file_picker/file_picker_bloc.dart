import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';

import '../../models/data/application_error.dart';

part 'file_picker_event.dart';
part 'file_picker_state.dart';

class FilePickerBloc extends Bloc<FilePickerEvent, FilePickerState> {
  FilePickerBloc() : super(FilePickerInitial()) {
    on<PickFile>((event, emit) async {
      emit(FilePickerLoading());
      try {
        final FilePickerResult? result = await FilePicker.platform.pickFiles(
          type: event.fileType,
        );

        if (result != null) {
          final File file = File(result.files.single.path!);
          emit(FilePickerFileLoaded(file));
        } else {
          emit(FilePickerInitial());
        }
      } catch (e) {
        emit(FilePickerError(ApplicationError(e.toString())));
      }
    });
  }
}
