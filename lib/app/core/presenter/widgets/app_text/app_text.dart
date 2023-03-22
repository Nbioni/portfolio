import 'package:flutter/material.dart';

import '../../../utils/definitions/typography.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final TextTypeEnum? textTypeEnum;
  final bool selectable;

  const AppText.pageTitle(
    this.text, {
    super.key,
    this.textAlign,
    this.textStyle,
    this.selectable = true,
  }) : textTypeEnum = TextTypeEnum.pageTitle;

  const AppText.pageSubtitle(
    this.text, {
    super.key,
    this.textAlign,
    this.textStyle,
    this.selectable = true,
  }) : textTypeEnum = TextTypeEnum.pageSubtitle;

  const AppText.sectionHeader1(
    this.text, {
    super.key,
    this.textAlign,
    this.textStyle,
    this.selectable = true,
  }) : textTypeEnum = TextTypeEnum.sectionHeader1;
  const AppText.sectionHeader2(
    this.text, {
    super.key,
    this.textAlign,
    this.textStyle,
    this.selectable = true,
  }) : textTypeEnum = TextTypeEnum.sectionHeader2;

  const AppText.text(
    this.text, {
    super.key,
    this.textAlign,
    this.textStyle,
    this.selectable = true,
  }) : textTypeEnum = TextTypeEnum.text;

  const AppText.text2(
    this.text, {
    super.key,
    this.textAlign,
    this.textStyle,
    this.selectable = true,
  }) : textTypeEnum = TextTypeEnum.text2;

  const AppText.reference(
    this.text, {
    super.key,
    this.textAlign = TextAlign.right,
    this.textStyle,
    this.selectable = true,
  }) : textTypeEnum = TextTypeEnum.reference;

  const AppText.reference2(
    this.text, {
    super.key,
    this.textAlign = TextAlign.right,
    this.textStyle,
    this.selectable = true,
  }) : textTypeEnum = TextTypeEnum.reference2;

  @override
  Widget build(BuildContext context) {
    Map<TextTypeEnum, TextStyle> stylesPerType = {
      TextTypeEnum.pageTitle: AppTypography.pageTitle,
      TextTypeEnum.pageSubtitle: AppTypography.pageSubtitle,
      TextTypeEnum.sectionHeader1: AppTypography.sectionHeader1,
      TextTypeEnum.sectionHeader2: AppTypography.sectionHeader2,
      TextTypeEnum.text: AppTypography.text,
      TextTypeEnum.text2: AppTypography.text2,
      TextTypeEnum.reference: AppTypography.reference,
      TextTypeEnum.reference2: AppTypography.reference2,
    };
    Text result = Text(
      text,
      textAlign: textAlign,
      style: stylesPerType[textTypeEnum]?.merge(textStyle),
    );
    return selectable ? SelectionArea(child: result) : result;
  }
}
