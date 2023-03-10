import 'package:flutter_modular/flutter_modular.dart';

import './presenter/controllers/core_controller.dart';

class CoreModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => CoreController(), export: true),
      ];
}
