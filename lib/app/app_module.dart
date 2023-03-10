import 'package:flutter_modular/flutter_modular.dart';

import './core/utils/definitions/routes.dart';
import './core/core_module.dart';
import './modules/home/home_module.dart';

const transitionType = TransitionType.fadeIn;

class AppModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          AppRoutes.home,
          module: HomeModule(),
          transition: transitionType,
        ),
      ];
}
