import 'dart:async';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../../core/presenter/controllers/core_controller.dart';
import '../../../../core/utils/definitions/animations.dart';
import '../../../../core/utils/definitions/colors.dart';
import '../../../../core/utils/definitions/experience.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  final CoreController core;

  HomeControllerBase(this.core);

  final PageController pageController = PageController();
  final ItemScrollController experienceScrollController =
      ItemScrollController();
  final CarouselController experienceCarouselController = CarouselController();
  final int defaultMillisecondsAnimationDuration =
      (AvatarAnimations.jumping.milliseconds * 0.5).round();
  final Color backgroundColor = AppColors.darkBackground;

  List<Timer> timers = [];

  final List<ExperienceData> experienceTimeline =
      MyExperience().getExperience();

  final int experienceScrollMilliseconds = 180;

  @observable
  int currentExperienceIndex = 0;

  @action
  void setCurrentExperienceIndex(int value) {
    isScrolling = true;

    currentExperienceIndex = value;
    experienceScrollController.scrollTo(
        index: currentExperienceIndex,
        alignment: 0.5,
        duration: Duration(milliseconds: experienceScrollMilliseconds),
        curve: Curves.linear);
    experienceCarouselController.animateToPage(currentExperienceIndex,
        duration: Duration(milliseconds: experienceScrollMilliseconds));

    core.cancelTimers(timers);
    Timer timer = Timer(
        Duration(milliseconds: (experienceScrollMilliseconds / 2).round()), () {
      isScrolling = false;
      core.cancelTimers(timers);
    });
    timers.add(timer);
  }

  @observable
  int currentSession = 0;

  @observable
  bool isScrolling = false;

  @action
  void setCurrentSession(int value) => currentSession = value;

  void onScrollEvent(double scrollDeltaDY) {
    if (isScrolling) return;
    if (scrollDeltaDY > 0) {
      onScrollingDown();
      return;
    }
    if (scrollDeltaDY < 0) {
      onScrollingUp();
      return;
    }
  }

  void onScrollingDown() {
    if (currentSession == 0) {
      setCurrentSession(1);
      jumpToSession1();
      return;
    }
    if (currentSession == 1) {
      setCurrentSession(2);
      jumpToSession2();
      return;
    }
    if (currentSession == 2) {
      if (currentExperienceIndex == experienceTimeline.length - 1) {
        setCurrentSession(3);
        jumpToSession3();
      } else {
        setCurrentExperienceIndex(currentExperienceIndex + 1);
      }
      return;
    }
  }

  void onScrollingUp() {
    var avaliableToScrollUp = [1, 2, 3];
    if (currentSession == 2 && currentExperienceIndex > 0) {
      setCurrentExperienceIndex(currentExperienceIndex - 1);
      return;
    }
    if (avaliableToScrollUp.contains(currentSession)) {
      int newCurrentSession = currentSession - 1;
      setCurrentSession(newCurrentSession);
      _animateToPage(newCurrentSession, defaultMillisecondsAnimationDuration);
      return;
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
    core.playAnimation(AvatarAnimations.showingSkills);
    core.playWithDelay(AvatarAnimations.showingSkills.milliseconds, () {
      core.playAnimation(AvatarAnimations.idle1);
      core.playWithDelay(AvatarAnimations.idle1.milliseconds, () {
        core.playAnimation(AvatarAnimations.showingSkills);
        core.playWithDelay(AvatarAnimations.showingSkills.milliseconds, () {
          core.playAnimation(AvatarAnimations.longTimeStanding);
          core.playWithDelay(AvatarAnimations.longTimeStanding.milliseconds,
              () {
            core.playAnimation(AvatarAnimations.idle4);
          });
        });
      });
    });
    _animateToPage(2, AvatarAnimations.jumping.milliseconds);
  }

  void jumpToSession3() {
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
    _animateToPage(3, AvatarAnimations.jumping.milliseconds);
  }

  dispose() {
    core.cancelTimers(timers);
    pageController.dispose();
  }
}
