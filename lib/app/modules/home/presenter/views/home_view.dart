import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/presenter/widgets/animated_background/animated_background.dart';
import '../../../../core/presenter/widgets/app_scaffold/app_scaffold.dart';
import '../../../../core/utils/extensions/app_scroll_behavior.dart';
import '../controllers/home_controller.dart';
import '../widgets/avatar_model_viewer/avatar_model_viewer.dart';
import './session0.dart';
import './session1.dart';
import './session2.dart';
import './session3.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController _homeController = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Title(
      title: "Nahaliel Bioni",
      color: Colors.white,
      child: AppScaffold(
        backgroundColor: _homeController.backgroundColor,
        coreController: _homeController.core,
        child: AppAnimatedBackground(
          child: Stack(
            children: [
              Container(
                alignment: Alignment.centerRight,
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: size.height * 0.9),
                  child: AspectRatio(
                    aspectRatio: 640 / 868,
                    child: LayoutBuilder(builder: (context, constraints) {
                      return const AvatarModelViewer();
                    }),
                  ),
                ),
              ),
              GestureDetector(
                onVerticalDragUpdate: (details) {
                  _homeController.onScrollEvent(-details.delta.dy);
                },
                child: Listener(
                  onPointerSignal: (pointerSignal) {
                    if (pointerSignal is PointerScrollEvent) {
                      _homeController
                          .onScrollEvent(pointerSignal.scrollDelta.dy);
                    }
                  },
                  child: PageView(
                    controller: _homeController.pageController,
                    scrollDirection: Axis.vertical,
                    padEnds: false,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollBehavior: AppScrollBehavior(),
                    children: [
                      Session0(
                        backgroundColor: _homeController.backgroundColor,
                        onJumpClick: () {
                          _homeController.setCurrentSession(1);
                          _homeController.jumpToSession1();
                        },
                      ),
                      const Session1(),
                      Session2(homeController: _homeController),
                      Session3(homeController: _homeController),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
