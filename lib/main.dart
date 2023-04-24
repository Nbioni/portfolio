import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:firebase_core/firebase_core.dart';

// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';

import './firebase_options.dart';
import './app/app_module.dart';
import './app/app_widget.dart';

void main() async {
  usePathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.current,
  );
  // ignore: unused_local_variable
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
