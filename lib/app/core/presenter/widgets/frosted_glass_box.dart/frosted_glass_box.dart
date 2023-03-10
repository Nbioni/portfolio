import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../utils/definitions/responsiveness.dart';
import '../../../utils/definitions/roundness.dart';

class FrostedGlassBox extends StatelessWidget {
  const FrostedGlassBox({
    super.key,
    required this.child,
    this.borderRadius = AppBorderRadius.m,
    required this.width,
    required this.height,
    required this.color,
    this.ovalShape = false,
  });

  final Widget child;
  final BorderRadius borderRadius;
  final double width;
  final double height;
  final Color color;
  final bool ovalShape;

  @override
  Widget build(BuildContext context) {
    Widget result = Container(
      width: width,
      height: height,
      color: Colors.transparent,
      child: Stack(
        children: [
          //blur effect
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 4,
              sigmaY: 4,
            ),
            child: Container(),
          ),
          //gradient effect
          LayoutBuilder(builder: (context, constraints) {
            bool isDesktop = AppResponsiveness()
                .isDesktop(MediaQuery.of(context).size.width);
            return Container(
              decoration: BoxDecoration(
                  borderRadius: borderRadius,
                  border: Border.all(
                    color: color.withOpacity(0.13),
                  ),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        color.withOpacity(isDesktop ? 0.3 : 0.4),
                        color.withOpacity(isDesktop ? 0.15 : 0.2),
                      ])),
            );
          }),
          // child
          child,
        ],
      ),
    );
    if (ovalShape) {
      return ClipOval(child: result);
    }
    return ClipRRect(
      borderRadius: borderRadius,
      child: result,
    );
  }
}
