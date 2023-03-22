import 'package:flutter/material.dart';

import './colors.dart';

class AppTypography {
  static const TextStyle pageTitle =
      TextStyle(color: Colors.white, fontSize: 56, fontWeight: FontWeight.bold);
  static const TextStyle pageSubtitle =
      TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold);
  static const TextStyle sectionHeader1 = TextStyle(
    color: Colors.white,
    fontSize: 28,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle sectionHeader2 = TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static TextStyle text = TextStyle(
    color: AppColors.whiteBackground,
    fontSize: 18,
  );
  static TextStyle text2 = TextStyle(
    color: AppColors.whiteBackground,
    fontSize: 16,
  );
  static TextStyle reference = TextStyle(
      color: AppColors.whiteBackground.withOpacity(0.4), fontSize: 14);
  static TextStyle reference2 = TextStyle(
      color: AppColors.whiteBackground.withOpacity(0.4), fontSize: 12);
}

enum TextTypeEnum {
  pageTitle,
  pageSubtitle,
  sectionHeader1,
  sectionHeader2,
  text,
  text2,
  reference,
  reference2,
}
