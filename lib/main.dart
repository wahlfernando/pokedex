import 'package:flutter/material.dart';
import 'features/pokedex/presentation/app_widget.dart';
import 'injection_container.dart' as di;

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const AppWidget());
}
