import 'package:cours_flutter_animation/clicker_page.dart';
import 'package:cours_flutter_animation/column_page.dart';
import 'package:cours_flutter_animation/sdk_page.dart';
import 'package:cours_flutter_animation/swap_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

void main() {
  Animate.restartOnHotReload = true; // Pour debug plus facilement en dev
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // --------- Décommenter les pages pour voir les différents exemples
      home: const SdkPage(),
      // home: const ClickerPage(),
      // home: const ColumnPage(),
      // home: const SwapPage(),
    );
  }
}
