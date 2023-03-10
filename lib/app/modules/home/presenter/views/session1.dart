import 'package:flutter/material.dart';

import '../../../../core/presenter/widgets/app_scaffold/app_scaffold.dart';
import '../../../../core/presenter/widgets/frosted_glass_box.dart/frosted_glass_box.dart';
import '../../../../core/presenter/widgets/slide_transition_widget.dart/slide_transition_widget.dart';
import '../../../../core/utils/definitions/colors.dart';
import '../../../../core/utils/definitions/responsiveness.dart';
import '../../../../core/utils/definitions/roundness.dart';
import '../../../../core/utils/definitions/spacing.dart';
import '../widgets/summary/summary.dart';

class Session1 extends StatelessWidget {
  const Session1({super.key});

  static const double boxWidth = 720;
  static const double boxHeight = 750;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double screenWidth = MediaQuery.of(context).size.width;
      double screenHeight = MediaQuery.of(context).size.height;
      double maxHeight = screenHeight - appHeaderHeight;
      bool isMobile = AppResponsiveness().isMobile(screenWidth);
      bool isMaxHeightArea = boxHeight > maxHeight;
      return SizedBox(
        height: maxHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SlideTransitionWidget(
              duration: const Duration(milliseconds: 2000),
              curve: Curves.elasticOut,
              begin: const Offset(-1.5, 0),
              end: const Offset(0, 0),
              child: FittedBox(
                fit: isMobile ? BoxFit.none : BoxFit.scaleDown,
                child: FrostedGlassBox(
                    width: isMobile ? screenWidth : boxWidth,
                    height: isMobile || isMaxHeightArea ? maxHeight : boxHeight,
                    color: AppColors.lightBlue,
                    borderRadius: AppBorderRadius.xl,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                              isMobile ? AppSpacing.xxl : AppSpacing.xxxl,
                          vertical: isMobile ? AppSpacing.xl : AppSpacing.xxl),
                      child: Summary(isMobile: isMobile || isMaxHeightArea),
                    )),
              ),
            ),
          ],
        ),
      );
    });
  }
}
