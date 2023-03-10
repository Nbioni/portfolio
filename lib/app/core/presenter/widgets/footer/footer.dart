import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:lottie/lottie.dart';

// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

import '../../../utils/constants/link_constants.dart';
import '../../../utils/definitions/colors.dart';
import '../../../utils/definitions/responsiveness.dart';
import '../../../utils/definitions/spacing.dart';
import '../../controllers/core_controller.dart';
import '../app_text/app_text.dart';

class Footer extends StatelessWidget {
  const Footer({super.key, required this.coreController});
  final CoreController coreController;

  Color _getLinkTextColor() => AppColors.whiteBackground.withOpacity(0.8);
  TextStyle _getLinkTextStyle() => TextStyle(color: _getLinkTextColor());
  Color _getTextColor() => AppColors.whiteBackground.withOpacity(0.6);
  TextStyle _getTextStyle() => TextStyle(color: _getTextColor());

  Widget _getPoweredByFlutterButton(bool isDesktop) {
    return TextButton(
      onPressed: () => js.context.callMethod('open', [flutterLink]),
      child: Column(
        children: [
          Row(
            mainAxisAlignment:
                isDesktop ? MainAxisAlignment.start : MainAxisAlignment.center,
            children: [
              AppText.text(
                "powered by \n Flutter",
                textAlign: TextAlign.center,
                selectable: false,
                textStyle: TextStyle(
                    color: AppColors.whiteBackground.withOpacity(0.4)),
              ),
              Opacity(
                opacity: 0.4,
                child: Lottie.asset(
                  'assets/animations/flutter.json',
                  repeat: true,
                  height: isDesktop ? 100 : 70,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LayoutBuilder(builder: (context, constraints) {
      bool isDesktop =
          AppResponsiveness().isDesktop(MediaQuery.of(context).size.width);
      return Stack(
        children: [
          Container(
            width: size.width,
            color: Colors.black.withOpacity(0.5),
            padding: AppEdgeInsets.xl,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppSizedBox.l,
                AnimatedTextKit(
                  animatedTexts: [
                    ColorizeAnimatedText('nbioni',
                        colors: [
                          AppColors.lightBlue,
                          AppColors.blue,
                          AppColors.darkBackground
                        ],
                        speed: const Duration(milliseconds: 2000),
                        textStyle: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                  displayFullTextOnTap: false,
                  stopPauseOnTap: false,
                  repeatForever: true,
                ),
                AppSizedBox.xxl,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: coreController.sendEmail,
                      child: AppText.text('Email',
                          selectable: false, textStyle: _getLinkTextStyle()),
                    ),
                    AppSizedBox.s,
                    TextButton(
                      onPressed: coreController.openLinkedin,
                      child: AppText.text('Linkedin',
                          selectable: false, textStyle: _getLinkTextStyle()),
                    ),
                    AppSizedBox.s,
                    TextButton(
                      onPressed: coreController.openGithub,
                      child: AppText.text('Github',
                          selectable: false, textStyle: _getLinkTextStyle()),
                    ),
                  ],
                ),
                AppSizedBox.s,
                TextButton.icon(
                  label: AppText.text(
                    "source code",
                    selectable: false,
                    textStyle: _getTextStyle(),
                  ),
                  icon: LineIcon.github(
                    color: _getTextColor(),
                    size: 38,
                  ),
                  onPressed: () =>
                      js.context.callMethod('open', [websiteRepositoryLink]),
                ),
                Visibility(
                    visible: !isDesktop,
                    child: Column(
                      children: [
                        AppSizedBox.s,
                        _getPoweredByFlutterButton(isDesktop),
                      ],
                    )),
                AppSizedBox.xxl,
                AppText.reference(
                  "©  2023 Nahaliel Bioni - nbioni.developer@gmail.com",
                  textAlign: TextAlign.center,
                  textStyle: TextStyle(
                      color: AppColors.whiteBackground.withOpacity(0.3)),
                ),
                AppSizedBox.xl,
              ],
            ),
          ),
          Visibility(
            visible: isDesktop,
            child: Positioned(
              bottom: -AppSpacing.l,
              left: 0,
              child: Padding(
                padding: AppEdgeInsets.xxxl,
                child: _getPoweredByFlutterButton(isDesktop),
              ),
            ),
          ),
        ],
      );
    });
  }
}
