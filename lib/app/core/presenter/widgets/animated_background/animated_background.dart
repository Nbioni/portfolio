import 'dart:math' as math;

import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';

import '../../../utils/definitions/colors.dart';

class AppAnimatedBackground extends StatefulWidget {
  const AppAnimatedBackground({super.key, required this.child});
  final Widget child;

  @override
  State<AppAnimatedBackground> createState() => _AppAnimatedBackgroundState();
}

class _AppAnimatedBackgroundState extends State<AppAnimatedBackground>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          tileMode: TileMode.clamp,
          colors: [
            AppColors.darkBackground.withOpacity(0.8),
            AppColors.darkBackground.withOpacity(0.4),
            AppColors.darkBackground.withOpacity(0.2),
            AppColors.blue.withOpacity(0.4),
            AppColors.blue.withOpacity(0.5),
          ],
          transform: const GradientRotation(math.pi / 8),
        ),
      ),
      child: AnimatedBackground(
        behaviour: RandomParticleBehaviour(
          options: ParticleOptions(
              spawnMinRadius: size.width / 21,
              spawnMaxRadius: size.width / 14,
              spawnMaxSpeed: 7,
              spawnMinSpeed: 7,
              particleCount: 7,
              minOpacity: 0.05,
              maxOpacity: 0.2,
              spawnOpacity: 0.05,
              baseColor: AppColors.blue,
              image: Image.asset(
                'assets/images/circle.png',
                color: AppColors.blue,
              )),
        ),
        vsync: this,
        child: Center(child: widget.child),
      ),
    );
  }
}
