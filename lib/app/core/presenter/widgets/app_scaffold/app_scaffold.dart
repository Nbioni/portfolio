import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';

import '../../../utils/definitions/colors.dart';
import '../../../utils/definitions/responsiveness.dart';
import '../../../utils/definitions/spacing.dart';
import '../../controllers/core_controller.dart';
import '../app_tooltip/app_tooltip.dart';

const double appHeaderHeight = 70;

class AppScaffold extends StatefulWidget {
  const AppScaffold(
      {super.key,
      required this.child,
      required this.backgroundColor,
      required this.coreController});
  final Widget child;
  final Color backgroundColor;

  final CoreController coreController;

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  Timer? _timer;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _timer = Timer.periodic(
          const Duration(seconds: 21), (Timer t) => setState(() {}));
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        flexibleSpace: SizedBox(
          height: 70,
          child: LayoutBuilder(builder: (context, constraints) {
            bool isDesktop = AppResponsiveness()
                .isDesktop(MediaQuery.of(context).size.width);
            return Padding(
              padding: EdgeInsets.only(
                  right: isDesktop ? AppSpacing.xxl : AppSpacing.xl),
              child: Row(
                children: [
                  TextLiquidFill(
                    key: UniqueKey(),
                    text: 'nbioni',
                    boxHeight: appHeaderHeight,
                    boxWidth: isDesktop ? 250 : 180,
                    waveColor: AppColors.blue,
                    boxBackgroundColor: widget.backgroundColor,
                    loadDuration: const Duration(seconds: 7),
                    textStyle: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  AppSizedBox.s,
                  AppTooltip(
                    message: 'Email',
                    child: IconButton(
                      icon: Icon(Icons.email, color: AppColors.blue),
                      onPressed: widget.coreController.sendEmail,
                    ),
                  ),
                  AppSizedBox.s,
                  AppTooltip(
                    message: 'LinkedIn',
                    child: IconButton(
                      icon: LineIcon.linkedinIn(color: AppColors.blue),
                      onPressed: widget.coreController.openLinkedin,
                    ),
                  ),
                  AppSizedBox.s,
                  AppTooltip(
                    message: 'GitHub',
                    child: IconButton(
                      icon: LineIcon.github(color: AppColors.blue),
                      onPressed: widget.coreController.openGithub,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
        backgroundColor: widget.backgroundColor,
        surfaceTintColor: widget.backgroundColor,
        elevation: 1,
        shadowColor: Colors.black,
      ),
      backgroundColor: widget.backgroundColor,
      body: widget.child,
    );
  }
}
