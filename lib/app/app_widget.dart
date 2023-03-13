import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/app/core/utils/definitions/colors.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.ubuntuTextTheme(),
        scaffoldBackgroundColor: AppColors.darkBackground,
        colorSchemeSeed: AppColors.blue,
        brightness: Brightness.dark,
      ),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return ResponsiveWrapper.builder(
            ClampingScrollWrapper.builder(
                context,
                Overlay(
                  initialEntries: [
                    OverlayEntry(
                      builder: (context) {
                        return child!;
                      },
                    ),
                  ],
                )),
            minWidth: 460,
            breakpoints: [
              const ResponsiveBreakpoint.autoScaleDown(450, name: MOBILE),
              const ResponsiveBreakpoint.resize(461, name: MOBILE),
              const ResponsiveBreakpoint.resize(768, name: TABLET),
              const ResponsiveBreakpoint.resize(1024, name: DESKTOP),
            ]);
      },
    );
  }
}
