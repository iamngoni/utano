//
//  utano_text_field
//  dhra
//
//  Created by Ngonidzashe Mangudya on 5/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/widgets.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../configs/colors.dart';

class UtanoTextField extends StatefulWidget {
  const UtanoTextField({
    required this.label,
    required this.placeholder,
    this.controller,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.obscureText = false,
    super.key,
  });

  final String label;
  final TextEditingController? controller;
  final int maxLines;
  final String placeholder;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final bool obscureText;

  @override
  State<UtanoTextField> createState() => _UtanoTextFieldState();
}

class _UtanoTextFieldState extends State<UtanoTextField> {
  String? _errorText;

  @override
  void initState() {
    super.initState();

    widget.controller?.addListener(() {
      if (widget.validator != null && widget.controller != null) {
        setState(() {
          _errorText = widget.validator!(widget.controller!.text);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.label,
              style: TextStyle(
                color: UtanoColors.grey,
                fontWeight: FontWeight.w400,
                fontSize: sy(12),
              ),
            ),
            SizedBox(
              height: sy(3),
            ),
            MacosTextField(
              padding: EdgeInsets.symmetric(
                vertical: sy(10),
                horizontal: sx(7),
              ),
              controller: widget.controller,
              obscureText: widget.obscureText,
              style: TextStyle(
                color: UtanoColors.black,
                fontWeight: FontWeight.w400,
                fontSize: sy(12),
              ),
              maxLines: widget.maxLines,
              placeholder: widget.placeholder,
              placeholderStyle: TextStyle(
                color: UtanoColors.grey,
                fontWeight: FontWeight.w400,
                fontSize: sy(12),
              ),
              decoration: BoxDecoration(
                color: UtanoColors.white,
                border: Border.all(
                  color: UtanoColors.border.withOpacity(0.5),
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(7),
              ),
              keyboardType: widget.keyboardType,
            ),
            if (_errorText != null)
              Padding(
                padding: EdgeInsets.only(
                  top: sy(5),
                ),
                child: Text(
                  _errorText!,
                  style: TextStyle(
                    color: UtanoColors.red,
                    fontWeight: FontWeight.w400,
                    fontSize: sy(10),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
