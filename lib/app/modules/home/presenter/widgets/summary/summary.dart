import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../../../../../core/presenter/widgets/app_text/app_rich_text.dart';
import '../../../../../core/presenter/widgets/app_text/app_text.dart';
import '../../../../../core/presenter/widgets/app_tooltip/app_tooltip.dart';
import '../../../../../core/utils/definitions/colors.dart';
import '../../../../../core/utils/definitions/spacing.dart';
import '../../../../../core/utils/definitions/typography.dart';
import '../curriculum_button/curriculum_button.dart';

class Summary extends StatelessWidget {
  const Summary({super.key, required this.isMobile});
  final bool isMobile;

  final String sumary1 =
      "As a dedicated and professional software developer with {getYearsOfWork} years of "
      "experience in various programming stacks, I am committed to providing innovative and "
      "efficient technological solutions. My strengths include being ";
  final String attentive = 'attentive';
  final String observant = 'observant';
  final String creative = 'creative';
  final String authentic = 'authentic';
  final String communicative = 'communicative';
  final String sumary2 =
      ". I'm always excited about growing my skills, learning, and contributing to the success "
      "of international technology companies.";

  final String education1 = "• Executive MBA in I.T. Management";
  final String education1Place = " - IPOG";
  final String education2 = "• Bachelor's Degree in Computer Engineering";
  final String education2Place =
      " - Pontifícia Universidade Católica de Goiás - February 2019.";

  final String skills1 = "• Executive MBA in I.T. Management";
  final String skills1Place = " - IPOG";
  final String skills2 = "• Bachelor's Degree in Computer Engineering";
  final String skills2Place =
      " - Pontifícia Universidade Católica de Goiás - February 2019.";

  TextStyle _getTextStyle() => isMobile
      ? AppTypography.text2
          .copyWith(color: AppTypography.text.color?.withOpacity(0.8))
      : AppTypography.text
          .copyWith(color: AppTypography.text.color?.withOpacity(0.8));

  final Duration titleAnimationDuration = const Duration(milliseconds: 300);

  String get getYearsOfWork {
    DateTime now = DateTime.now();
    DateTime firstJobDate = DateTime(2014, 2, 1);
    Duration diff = now.difference(firstJobDate);
    return (diff.inDays ~/ 365).toString();
  }

  TextStyle _getEducationPlaceTextStyle() => AppTypography.reference;
  TextStyle _getSummaryHighlightTextStyle() =>
      AppTypography.text.copyWith(color: AppColors.lightBlue);

  Widget _getTitle(String title) {
    return AnimatedTextKit(
      key: ValueKey('$title-$isMobile'),
      animatedTexts: [
        TypewriterAnimatedText(
          title,
          textStyle: isMobile
              ? AppTypography.sectionHeader2
              : AppTypography.sectionHeader1,
          speed: titleAnimationDuration,
        ),
      ],
      totalRepeatCount: 1,
    );
  }

  _getSkillImage(String path, String tooltipMessage, int years) => AppTooltip(
      message: tooltipMessage,
      margin: AppEdgeInsets.s,
      child: Column(
        children: [
          Image.asset(path, height: isMobile ? 32 : 45),
          AppText.reference(
            '${years.toString()} years',
          )
        ],
      ));

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _getTitle("Summary"),
        isMobile ? AppSizedBox.xs : AppSizedBox.m,
        DefaultTextStyle(
          style: AppTypography.text,
          textAlign: TextAlign.justify,
          child: SelectionArea(
            child: AppRichText(
              style: _getTextStyle(),
              children: [
                AppText.text(
                  sumary1.replaceFirst('{getYearsOfWork}', getYearsOfWork),
                ),
                AppText.text(attentive,
                    textStyle: _getSummaryHighlightTextStyle()),
                const AppText.text(', '),
                AppText.text(observant,
                    textStyle: _getSummaryHighlightTextStyle()),
                const AppText.text(', '),
                AppText.text(creative,
                    textStyle: _getSummaryHighlightTextStyle()),
                const AppText.text(', '),
                AppText.text(authentic,
                    textStyle: _getSummaryHighlightTextStyle()),
                const AppText.text(', and '),
                AppText.text(communicative,
                    textStyle: _getSummaryHighlightTextStyle()),
                AppText.text(sumary2),
              ],
            ),
          ),
        ),
        isMobile ? AppSizedBox.m : AppSizedBox.xl,
        _getTitle("Education"),
        isMobile ? AppSizedBox.xs : AppSizedBox.m,
        AppRichText(
          style: _getTextStyle(),
          children: [
            AppText.text(education1),
            AppText.reference(education1Place,
                textStyle: _getEducationPlaceTextStyle()),
            const AppText.text('\n'),
            AppText.text(education2),
            AppText.reference(education2Place,
                textStyle: _getEducationPlaceTextStyle()),
          ],
        ),
        isMobile ? AppSizedBox.m : AppSizedBox.xl,
        _getTitle("Skills"),
        isMobile ? AppSizedBox.s : AppSizedBox.m,
        Wrap(
          spacing: AppSpacing.xl,
          children: [
            _getSkillImage('assets/images/c_sharp.png', 'C Sharp', 4),
            _getSkillImage('assets/images/css3.png', 'CSS', 4),
            _getSkillImage('assets/images/dart.png', 'Dart', 3),
            _getSkillImage('assets/images/flutter.png', 'Flutter', 3),
            _getSkillImage('assets/images/html5.png', 'HTML', 4),
            _getSkillImage('assets/images/javascript.png', 'JavaScript', 4),
            _getSkillImage('assets/images/node.png', 'Node.js', 1),
            _getSkillImage('assets/images/react.png', 'React', 2),
            _getSkillImage('assets/images/typescript.png', 'TypeScript', 1),
          ],
        ),
        isMobile ? AppSizedBox.l : AppSizedBox.xxl,
        const Expanded(child: SizedBox()),
        isMobile
            ? const SizedBox.shrink()
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CurriculumButton(isMobile: isMobile),
                ],
              ),
        const Expanded(child: SizedBox()),
      ],
    );
  }
}
