import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ColumnPage extends StatelessWidget {
  const ColumnPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Column Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text("Texte A"),
            const Text("Texte B"),
            const Text("Texte C"),
            const Text("Texte D"),
            const Text("Texte E"),
          ].animate(interval: 100.ms).fade(duration: 1.seconds),
          // .animate(interval: 500.ms)
          // .slideX(begin: -5),
          // Ici on crée une animation qui va s'appliquer à tous les enfants.
          // On utilise interval pour que cela se fasse les uns après les autres
        ),
      ),
    );
  }
}
