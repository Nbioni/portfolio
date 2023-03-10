import 'package:flutter_modular/flutter_modular.dart';

import './presenter/controllers/home_controller.dart';
import './presenter/views/home_view.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeController(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => const HomeView(),
    ),
  ];
}
