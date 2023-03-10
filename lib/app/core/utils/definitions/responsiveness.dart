class AppResponsiveness {
  static const double minTabletWidth = 768;
  static const double minDesktopWidth = 1024;

  bool isMobile(double screenWidth) => screenWidth < minTabletWidth;
  bool isTablet(double screenWidth) =>
      screenWidth >= minTabletWidth && screenWidth < minDesktopWidth;
  bool isDesktop(double screenWidth) => screenWidth >= minDesktopWidth;
}
