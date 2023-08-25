import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';

import '../../../../core/presenter/widgets/app_scaffold/app_scaffold.dart';
import '../../../../core/presenter/widgets/app_text/app_text.dart';
import '../../../../core/presenter/widgets/frosted_glass_box.dart/frosted_glass_box.dart';
import '../../../../core/presenter/widgets/jumping_widget/jumping_widget.dart';
import '../../../../core/presenter/widgets/slide_transition_widget.dart/slide_transition_widget.dart';
import '../../../../core/utils/definitions/colors.dart';
import '../../../../core/utils/definitions/responsiveness.dart';
import '../../../../core/utils/definitions/roundness.dart';
import '../../../../core/utils/definitions/spacing.dart';
import '../../../../core/utils/definitions/typography.dart';

class Session0 extends StatelessWidget {
  const Session0(
      {super.key, required this.backgroundColor, required this.onJumpClick});
  final Color backgroundColor;
  final void Function() onJumpClick;

  static const double buttonHeight = 200;
  static const double boxWidth = 600;
  static const double boxHeight = 380;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LayoutBuilder(builder: (context, constraints) {
      bool isMobile =
          AppResponsiveness().isMobile(MediaQuery.of(context).size.width);
      return ConstrainedBox(
        constraints: BoxConstraints(maxHeight: size.height - appHeaderHeight),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(child: SizedBox()),
            SlideTransitionWidget(
              duration: const Duration(milliseconds: 2000),
              curve: Curves.elasticOut,
              begin: const Offset(-1.5, 0),
              end: const Offset(0, 0),
              child: FrostedGlassBox(
                width: boxWidth,
                height: isMobile ? 320 : 380,
                color: AppColors.lightBlue,
                borderRadius: AppBorderRadius.xl,
                child: Padding(
                  padding: AppEdgeInsets.xxxl,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            "Hey, I am",
                            textStyle: isMobile
                                ? AppTypography.sectionHeader1
                                : AppTypography.pageSubtitle,
                            speed: const Duration(milliseconds: 250),
                          ),
                        ],
                        totalRepeatCount: 1,
                        displayFullTextOnTap: true,
                        stopPauseOnTap: true,
                        repeatForever: false,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: AnimatedTextKit(
                          key: ValueKey('Nahaliel Bioni-$isMobile'),
                          animatedTexts: [
                            ColorizeAnimatedText(
                              'Nahaliel Bioni',
                              colors: [
                                AppColors.lightBlue,
                                AppColors.blue,
                                AppColors.darkBackground
                              ],
                              speed: const Duration(milliseconds: 1000),
                              textStyle: isMobile
                                  ? AppTypography.pageSubtitle
                                  : AppTypography.pageTitle,
                            ),
                          ],
                          totalRepeatCount: 1,
                          displayFullTextOnTap: false,
                          stopPauseOnTap: false,
                          repeatForever: false,
                        ),
                      ),
                      AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            "Creative Software Engineer",
                            textStyle: AppTypography.text,
                            speed: const Duration(milliseconds: 100),
                          ),
                        ],
                        totalRepeatCount: 1,
                        displayFullTextOnTap: true,
                        stopPauseOnTap: true,
                        repeatForever: false,
                      ),
                      const Expanded(child: SizedBox()),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          AppText.reference(
                              '"Intelligence is the ability to adapt to change." \n~Stephen Hawking'),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: buttonHeight,
              alignment: Alignment.center,
              child: JumpingWidget(
                child: IconButton(
                  icon: LineIcon.angleDown(
                    size: 24,
                    color: AppColors.whiteBackground,
                  ),
                  onPressed: onJumpClick,
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
