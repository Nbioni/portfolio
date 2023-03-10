import 'package:flutter/material.dart';

class AppRoundness {
  static const double s = 4;
  static const double m = 8;
  static const double l = 16;
  static const double xl = 32;
}

class AppRadius {
  static const Radius s = Radius.circular(AppRoundness.s);
  static const Radius m = Radius.circular(AppRoundness.m);
  static const Radius l = Radius.circular(AppRoundness.l);
  static const Radius xl = Radius.circular(AppRoundness.xl);
}

class AppBorderRadius {
  static const BorderRadius m = BorderRadius.all(AppRadius.m);
  static const BorderRadius l = BorderRadius.all(AppRadius.l);
  static const BorderRadius xl = BorderRadius.all(AppRadius.xl);
}
