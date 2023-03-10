import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/definitions/colors.dart';
import '../../../utils/definitions/roundness.dart';
import '../../../utils/definitions/spacing.dart';

class AppTooltip extends StatelessWidget {
  const AppTooltip({
    super.key,
    required this.child,
    required this.message,
    this.preferBelow = true,
    this.margin,
  });
  final Widget child;
  final String message;
  final bool preferBelow;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message,
      decoration: BoxDecoration(
        borderRadius: AppBorderRadius.m,
        gradient: LinearGradient(colors: [
          AppColors.black.withOpacity(0.9),
          AppColors.black.withOpacity(0.8),
        ]),
      ),
      padding: AppEdgeInsets.xxs,
      preferBelow: preferBelow,
      margin: margin,
      textStyle: GoogleFonts.actor(
        fontSize: 14,
        color: AppColors.whiteBackground.withOpacity(0.8),
      ),
      child: child,
    );
  }
}
