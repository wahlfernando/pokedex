import 'package:flutter/material.dart';
import 'pages/pokemon_page.dart';
import 'stores/pokemon_store.dart';
import 'package:flutterpokedex/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final store = di.sl<PokemonStore>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: PokemonPage(store: store),
    );
  }
}
