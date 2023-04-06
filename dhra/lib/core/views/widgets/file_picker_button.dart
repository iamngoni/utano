//
//  file_picker_button
//  dhra
//
//  Created by Ngonidzashe Mangudya on 6/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../blocs/file_picker/file_picker_bloc.dart';
import '../../configs/colors.dart';

class FilePickerButton extends StatelessWidget {
  const FilePickerButton({
    required this.bloc,
    super.key,
  });

  final FilePickerBloc bloc;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return GestureDetector(
          onTap: () => bloc.state is! FilePickerLoading
              ? bloc.add(
                  const PickFile(
                    FileType.image,
                  ),
                )
              : null,
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: sy(10),
              horizontal: sx(7),
            ),
            decoration: BoxDecoration(
              color: UtanoColors.white,
              border: Border.all(
                color: UtanoColors.border.withOpacity(0.5),
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(7),
            ),
            child: BlocBuilder(
              bloc: bloc,
              builder: (context, state) {
                late Widget buttonWidget;
                if (state is FilePickerFileLoaded) {
                  buttonWidget = Row(
                    children: [
                      Icon(
                        CupertinoIcons.photo,
                        color: UtanoColors.grey,
                        size: sy(15),
                      ),
                      SizedBox(
                        width: sx(5),
                      ),
                      Text(
                        state.file.path.split('/').last,
                        style: TextStyle(
                          color: UtanoColors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: sy(12),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  );
                } else if (state is FilePickerLoading) {
                  buttonWidget = Center(
                    child: CupertinoActivityIndicator(
                      radius: sy(6),
                      color: UtanoColors.black,
                    ),
                  );
                } else {
                  buttonWidget = Row(
                    children: [
                      Icon(
                        CupertinoIcons.photo,
                        color: UtanoColors.grey,
                        size: sy(15),
                      ),
                      SizedBox(
                        width: sx(5),
                      ),
                      Text(
                        'Upload Logo',
                        style: TextStyle(
                          color: UtanoColors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: sy(12),
                        ),
                      ),
                    ],
                  );
                }
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: buttonWidget,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
