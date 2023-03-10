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
  static TextStyle reference = TextStyle(
      color: AppColors.whiteBackground.withOpacity(0.4), fontSize: 14);
  static TextStyle text = TextStyle(
    color: AppColors.whiteBackground,
    fontSize: 18,
  );
}

enum TextTypeEnum {
  pageTitle,
  pageSubtitle,
  sectionHeader1,
  sectionHeader2,
  reference,
  text,
}
