import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';

import './app/app_module.dart';
import './app/app_widget.dart';

void main() {
  usePathUrlStrategy();
  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
