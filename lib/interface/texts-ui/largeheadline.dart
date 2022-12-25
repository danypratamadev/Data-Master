import 'package:flutter/material.dart';
import 'package:data_master/providers/provider.dart';
import 'package:data_master/shared/theme.dart';
import 'package:provider/provider.dart';

class LargeHeadlineText extends StatelessWidget {

  final String label;
  final String fontFamily;
  final bool customColor;
  final Color? textColor;
  final double heightSpaceing;
  final TextAlign textAlign;
  final int maxLines;
  
  const LargeHeadlineText({super.key, required this.label, this.fontFamily = jakartaBold, this.customColor = false, this.textColor, this.heightSpaceing = 1.3, this.textAlign = TextAlign.start, this.maxLines = 2});

  @override
  Widget build(BuildContext context) {

    final themeApp = Theme.of(context);

    return Consumer<MainProvider>(
      builder: (contextt, value, child) => Text(
        label,
        style: themeApp.textTheme.headline4?.copyWith(
          fontFamily: fontFamily,
          color: customColor ? textColor : null,
          height: heightSpaceing
        ),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        textScaleFactor: value.textScaleFactor,
        softWrap: true,
      ),
    );
  }
}