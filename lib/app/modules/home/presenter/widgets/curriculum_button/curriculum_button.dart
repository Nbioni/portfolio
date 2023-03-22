import 'package:flutter/material.dart';
import 'package:portfolio/app/core/utils/definitions/typography.dart';

// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

import '../../../../../core/presenter/widgets/app_text/app_text.dart';
import '../../../../../core/utils/constants/link_constants.dart';
import '../../../../../core/utils/definitions/spacing.dart';

class CurriculumButton extends StatelessWidget {
  const CurriculumButton({super.key, required this.isMobile});
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => js.context.callMethod('open', [curriculumNahalielLink]),
      child: Padding(
        padding: isMobile ? AppEdgeInsets.xxs : AppEdgeInsets.xs,
        child: AppText.text(
          'Curriculum Vitae (PDF)',
          textStyle: isMobile
              ? AppTypography.reference.copyWith(color: Colors.white)
              : AppTypography.text,
          selectable: false,
        ),
      ),
    );
  }
}
