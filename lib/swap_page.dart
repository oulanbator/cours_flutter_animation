import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SwapPage extends StatefulWidget {
  const SwapPage({super.key});

  @override
  State<SwapPage> createState() => _SwapPageState();
}

class _SwapPageState extends State<SwapPage> {
  var _clicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Swap Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Ici on se sert de animate().swap() pour remplacer un widget
            // par un autreau bout d'un certain temps
            const Text(
              "Avant",
              style: TextStyle(fontSize: 50, color: Colors.blue),
            ).animate().swap(
                  duration: 1.seconds,
                  builder: (_, __) {
                    return const Text(
                      "Après",
                      style:
                          TextStyle(fontSize: 50, color: Colors.orangeAccent),
                    );
                    // .animate().fade(duration: 1.seconds);
                  },
                ),

            // Ici on utlise target pour "atteindre" un point de notre animation en
            // fonction de la valeur de _clicked (0 = début, 1 = fin)
            // _clicked est modifié par le bouton plus bas.
            const Text(
              "Animé au clic",
              style: TextStyle(fontSize: 50),
            )
                .animate(target: _clicked ? 1 : 0)
                .tint(color: Colors.red, duration: 1.2.seconds),

            ElevatedButton(
              onPressed: () => setState(() {
                _clicked = !_clicked;
              }),
              child: const Text("Déclencheur"),
            )
          ],
        ),
      ),
    );
  }
}
