import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ClickerPage extends StatefulWidget {
  const ClickerPage({super.key});

  @override
  State<ClickerPage> createState() => _ClickerPageState();
}

class _ClickerPageState extends State<ClickerPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Clicker Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            )
                .animate(
                  onPlay: (controller) => controller.repeat(reverse: true),
                )
                .slideX(
                  delay: 500.ms,
                  begin: -1.2,
                ) // joue avec le delay et la position de départ
                // Utilisation de then pour séquencer nos animations
                //(attendre la fin de l'animation précédente avant de jouer la suivante)
                .then()
                .tint(
                  color: Colors.blue,
                ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ).animate().fade(duration: 1500.ms),

            Text(
              "Hello world",
              style: TextStyle(fontSize: 30),
            ).animate().fade(),

            // Pour une gestion encore plus poussée on peut utiliser un controller.
            // On peut le récupérer dans animate().
            // Le controlleur va nous permettre de target un callback à un moment
            // donné du cycle de l'animation.
            // - onInit : avant même que l'animation soit jouée
            // - onPlay : S'il y a un délai p.ex, appelé au moment où l'animation commence
            // - onComplete : appelé à la fin de l'animation
            const Text(
              "Je change de couleur à l'infini",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            )
                .animate(
                  onPlay: (controller) => controller.repeat(reverse: true),
                  // onPlay: (controller) => controller.repeat(reverse: true),
                )
                .tint(
                  duration: 1.seconds,
                  color: Colors.red,
                )
                .then(
                  delay: 1
                      .seconds, // on peut rajouter du delay sur le then directement
                )
                .tint(
                  duration: 1.seconds,
                  color: Colors.yellow,
                )
                .then()
                .tint(
                  duration: 1.seconds,
                  color: Colors.blue,
                )
            // .then()
            // .tint(
            //   duration: 1.seconds,
            //   color: Colors.black,
            // ), // on peut rajouter la couleur initiale en fin si besoin
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
