// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;
import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/constants/link_constants.dart';
import '../../utils/definitions/animations.dart';

part 'core_controller.g.dart';

class CoreController = CoreControllerBase with _$CoreController;

abstract class CoreControllerBase with Store {
  CoreControllerBase();

  @observable
  bool loading = false;

  @action
  void setLoading(bool isLoading) => loading = isLoading;

  List<Timer> timers = [];

  void playAnimation(AvatarAnimation animation, {bool reset = false}) {
    js.context.callMethod("play", [animation.name, reset]);
  }

  void playWithDelay(int millisseconds, void Function() playFunction) {
    cancelTimers(timers);
    Timer timer =
        Timer(Duration(milliseconds: millisseconds), () => playFunction.call());
    timers.add(timer);
  }

  void cancelTimers(List<Timer> timersToCancel) {
    for (Timer timer in timersToCancel) {
      timer.cancel();
    }
    timers = [];
  }

  void sendEmail() {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'nbioni.developer@gmail.com',
    );
    launchUrl(emailLaunchUri);
  }

  void openLinkedin() => js.context.callMethod('open', [myLinkedinLink]);

  void openGithub() => js.context.callMethod('open', [myGithubLink]);
}
