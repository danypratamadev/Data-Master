import 'package:flutter/material.dart';
import 'package:data_master/providers/provider.dart';
import 'package:data_master/shared/theme.dart';
import 'package:provider/provider.dart';

class CaptionText extends StatelessWidget {

  final String label;
  final String fontFamily;
  final bool customColor;
  final Color? textColor;
  final double heightSpaceing;
  final TextAlign textAlign;
  final int maxLines;

  const CaptionText({super.key, required this.label, this.fontFamily = interRegular, this.customColor = false, this.textColor, this.heightSpaceing = 1.3, this.textAlign = TextAlign.start, this.maxLines = 2});

  @override
  Widget build(BuildContext context) {

    final themeApp = Theme.of(context);

    return Consumer<MainProvider>(
      builder: (contextt, value, child) => Text(
        label,
        style: themeApp.textTheme.caption?.copyWith(
          fontFamily: fontFamily,
          color: customColor ? textColor : null,
          height: heightSpaceing,
          letterSpacing: 0.35,
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