import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/presenter/widgets/app_scaffold/app_scaffold.dart';
import '../../../../core/presenter/widgets/app_text/app_text.dart';
import '../../../../core/presenter/widgets/footer/footer.dart';
import '../../../../core/presenter/widgets/frosted_glass_box.dart/frosted_glass_box.dart';
import '../../../../core/presenter/widgets/slide_transition_widget.dart/slide_transition_widget.dart';
import '../../../../core/utils/definitions/colors.dart';
import '../../../../core/utils/definitions/responsiveness.dart';
import '../../../../core/utils/definitions/roundness.dart';
import '../../../../core/utils/definitions/spacing.dart';
import '../../../../core/utils/definitions/typography.dart';
import '../controllers/home_controller.dart';

class Session2 extends StatelessWidget {
  const Session2({super.key, required this.homeController});
  final HomeController homeController;
  final String title = "Let's build apps for ";

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double screenWidth = MediaQuery.of(context).size.width;
      double screenHeight = MediaQuery.of(context).size.height;
      double maxHeight = screenHeight - appHeaderHeight;
      bool isMobile = AppResponsiveness().isMobile(screenWidth);
      bool mustBeMobile =
          maxHeight < AppResponsiveness.minTabletWidth || isMobile;

      return SizedBox(
        height: maxHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(child: SizedBox()),
            SlideTransitionWidget(
              duration: const Duration(milliseconds: 2000),
              curve: Curves.elasticOut,
              begin: const Offset(-1, 0),
              end: const Offset(0, 0),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: FrostedGlassBox(
                  width: mustBeMobile ? 450 : 700,
                  height: mustBeMobile ? 200 : 300,
                  color: AppColors.lightBlue,
                  borderRadius: AppBorderRadius.xl,
                  child: Padding(
                    padding: mustBeMobile ? AppEdgeInsets.l : AppEdgeInsets.xxl,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset(
                          'assets/animations/developer.json',
                          repeat: true,
                          height: mustBeMobile ? 120 : 200,
                        ),
                        AppSizedBox.m,
                        SizedBox(
                          height: 120,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Visibility(
                                  visible: !mustBeMobile,
                                  child: AppText.sectionHeader1(title)),
                              Visibility(
                                  visible: mustBeMobile,
                                  child: AppText.sectionHeader2(title)),
                              SizedBox(
                                width: mustBeMobile ? 180 : 270,
                                height: mustBeMobile ? 40 : 80,
                                child: DefaultTextStyle(
                                  style: mustBeMobile
                                      ? AppTypography.sectionHeader1
                                      : AppTypography.pageTitle,
                                  textAlign: TextAlign.start,
                                  child: AnimatedTextKit(
                                    repeatForever: true,
                                    animatedTexts: [
                                      FadeAnimatedText('Mobile',
                                          textAlign: TextAlign.start),
                                      FadeAnimatedText('Web',
                                          textAlign: TextAlign.start),
                                      FadeAnimatedText('Desktop',
                                          textAlign: TextAlign.start),
                                      FadeAnimatedText('Embedded',
                                          textAlign: TextAlign.start),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Expanded(child: SizedBox()),
            Footer(coreController: homeController.core),
          ],
        ),
      );
    });
  }
}
