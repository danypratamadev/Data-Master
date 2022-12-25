import 'package:flutter/material.dart';
import 'package:data_master/shared/variables.dart';

class TextFormFieldApp extends StatelessWidget {

  final TextEditingController controller;
  final String hintText;
  final EdgeInsets contentPadding;
  final TextAlign textAlign;
  final TextInputType textInputType;
  final int maxLength;
  final int maxLines;
  final bool obscureText;
  final bool readOnly;
  final bool suffixEnable;
  final Widget? suffixIcon;
  final ValueChanged<String> onChange;

  const TextFormFieldApp({super.key, required this.controller, required this.hintText, this.contentPadding = const EdgeInsets.symmetric(horizontal: secondaryPaddingSize, vertical: sizedBox18), this.textAlign = TextAlign.start, this.textInputType = TextInputType.text, this.maxLength = 100, this.maxLines = 1, this.obscureText = false, this.readOnly = false, this.suffixEnable = false, this.suffixIcon, required this.onChange});

  @override
  Widget build(BuildContext context) {

    final themeApp = Theme.of(context);

    return Stack(
      children: [
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          readOnly: readOnly,
          scrollPhysics: BouncingScrollPhysics(),
          cursorRadius: Radius.circular(sizedBox2),
          cursorWidth: 2,
          onChanged: onChange,
          decoration: InputDecoration(
            contentPadding: contentPadding,
            hintText: hintText,
            border: InputBorder.none,
            isDense: true,
            counterText: '',
          ),
          style: themeApp.textTheme.subtitle1?.copyWith(),
          textAlign: textAlign,
          keyboardType: textInputType,
          maxLength: maxLength,
          maxLines: maxLines != 200 ? maxLines : null,
        ),
        if(suffixEnable)
        Positioned(
          top: 0.0,
          bottom: 0.0,
          right: secondaryPaddingSize,
          child: Center(
            child: suffixIcon
          )
        )
      ],
    );
  }
}