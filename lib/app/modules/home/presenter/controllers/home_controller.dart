import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/presenter/controllers/core_controller.dart';
import '../../../../core/utils/definitions/animations.dart';
import '../../../../core/utils/definitions/colors.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  final CoreController core;

  HomeControllerBase(this.core);

  final PageController pageController = PageController();
  final int defaultMillisecondsAnimationDuration =
      (AvatarAnimations.jumping.milliseconds * 0.5).round();
  final Color backgroundColor = AppColors.darkBackground;

  List<Timer> timers = [];

  @observable
  int currentSession = 0;

  @observable
  bool isScrolling = false;

  @action
  void setCurrentSession(int value) => currentSession = value;

  void onScrollEvent(PointerScrollEvent pointerSignal) {
    if (isScrolling) return;
    if (pointerSignal.scrollDelta.dy > 0) {
      // --- scrolling down ---
      if (currentSession == 0) {
        setCurrentSession(1);
        jumpToSession1();
      } else if (currentSession == 1) {
        setCurrentSession(2);
        jumpToSession2();
      }
    } else if (pointerSignal.scrollDelta.dy < 0) {
      if (currentSession == 1 || currentSession == 2) {
        int newCurrentSession = currentSession - 1;
        setCurrentSession(newCurrentSession);
        _animateToPage(newCurrentSession, defaultMillisecondsAnimationDuration);
      }
    }
  }

  void _animateToPage(int session, int milliseconds) {
    isScrolling = true;
    pageController.animateToPage(
      session,
      curve: Curves.easeInQuart,
      duration: Duration(milliseconds: milliseconds),
    );

    core.cancelTimers(timers);
    Timer timer = Timer(Duration(milliseconds: milliseconds), () {
      isScrolling = false;
      core.cancelTimers(timers);
    });
    timers.add(timer);
  }

  void jumpToSession1() {
    core.cancelTimers(timers);
    core.playAnimation(AvatarAnimations.jumping, reset: true);
    core.playWithDelay(AvatarAnimations.jumping.milliseconds, () {
      core.playAnimation(AvatarAnimations.showingSkills);
      core.playWithDelay(AvatarAnimations.showingSkills.milliseconds, () {
        core.playAnimation(AvatarAnimations.longTimeStanding);
        core.playWithDelay(AvatarAnimations.longTimeStanding.milliseconds, () {
          core.playAnimation(AvatarAnimations.showingSkills);
          core.playWithDelay(AvatarAnimations.showingSkills.milliseconds, () {
            core.playAnimation(AvatarAnimations.idle5);
          });
        });
      });
    });
    _animateToPage(1, AvatarAnimations.jumping.milliseconds);
  }

  void jumpToSession2() {
    core.cancelTimers(timers);
    core.playAnimation(AvatarAnimations.mouseOnBottom);
    core.playWithDelay(AvatarAnimations.mouseOnBottom.milliseconds, () {
      core.playAnimation(AvatarAnimations.idle2);
      core.playWithDelay(AvatarAnimations.idle2.milliseconds, () {
        core.playAnimation(AvatarAnimations.mouseOnBottom);
        core.playWithDelay(AvatarAnimations.mouseOnBottom.milliseconds, () {
          core.playAnimation(AvatarAnimations.mouseOnBottom);
          core.playWithDelay(AvatarAnimations.mouseOnBottom.milliseconds, () {
            core.playAnimation(AvatarAnimations.idle3);
          });
        });
      });
    });
    _animateToPage(2, AvatarAnimations.jumping.milliseconds);
  }

  dispose() {
    core.cancelTimers(timers);
    pageController.dispose();
  }
}
