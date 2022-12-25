import 'package:flutter/material.dart';
import 'package:data_master/providers/provider.dart';
import 'package:data_master/shared/variables.dart';
import 'package:provider/provider.dart';

class RoundedCard extends StatelessWidget {

  final double cardRadius;
  final EdgeInsets cardPadding;
  final bool useCustomBgColor;
  final Color? customCardBgColor;
  final bool useGradientBgColor;
  final LinearGradient? gradientCardBgColor;
  final Widget child;

  const RoundedCard({super.key, this.cardRadius = secondaryRoundedCardSize, this.cardPadding = EdgeInsets.zero, this.useCustomBgColor = false, this.customCardBgColor, required this.child, this.useGradientBgColor = false, this.gradientCardBgColor});

  @override
  Widget build(BuildContext context) {

    final themeApp = Theme.of(context);

    return Consumer<MainProvider>(
      builder: (contextt, value, childs) => PhysicalModel(
        color: Colors.transparent,
        shadowColor: value.darkMode ? Colors.transparent : themeApp.dividerColor,
        borderRadius: BorderRadius.circular(cardRadius),
        elevation: value.showCardShadow && !value.showCardBorder ? 10.0 : 0.0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(cardRadius),
          child: Container(
            child: child,
            padding: cardPadding,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(cardRadius),
              color: useCustomBgColor ? customCardBgColor : themeApp.backgroundColor,
              gradient: useGradientBgColor ? gradientCardBgColor : null,
              border: Border.all(
                color: value.showCardBorder ? themeApp.dividerColor : Colors.transparent,
                width: value.showCardBorder ? secondaryDividerSize : 0.0,
              )
            )
          ),
        ),
      ),
    );
  }
}