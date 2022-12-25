import 'package:flutter/material.dart';
import 'package:data_master/providers/provider.dart';
import 'package:data_master/shared/theme.dart';
import 'package:provider/provider.dart';

class SubtitleText extends StatelessWidget {

  final String label;
  final String fontFamily;
  final bool customColor;
  final Color? textColor;
  final double heightSpaceing;
  final TextAlign textAlign;
  final int maxLines;
  final double letterSpacing;

  const SubtitleText({super.key, required this.label, this.fontFamily = jakartaMedium, this.customColor = false, this.textColor, this.heightSpaceing = 1.3, this.textAlign = TextAlign.start, this.maxLines = 2, this.letterSpacing = 0.0});

  @override
  Widget build(BuildContext context) {

    final themeApp = Theme.of(context);

    return Consumer<MainProvider>(
      builder: (contextt, value, child) => Text(
        label,
        style: themeApp.textTheme.subtitle2?.copyWith(
          fontFamily: fontFamily,
          color: customColor ? textColor : null,
          height: heightSpaceing,
          letterSpacing: letterSpacing != 0 ? letterSpacing : null,
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