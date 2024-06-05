import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SdkPage extends StatefulWidget {
  const SdkPage({super.key});

  @override
  State<SdkPage> createState() => _SdkPageState();
}

class _SdkPageState extends State<SdkPage> {
  bool _containerSmall = true;
  double _width = 50;
  double _height = 50;
  Color _color = Colors.white;
  bool _visible = false;
  Alignment _alignment = Alignment.centerLeft;
  bool _showFirst = true;

  @override
  void initState() {
    super.initState();
    // Modifie les paramètres des animations après un délai pour permettre aux
    // widgets de se construire.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _containerSmall = false;
        _width = 200;
        _height = 200;
        _color = Colors.yellow;
        _visible = true;
        _alignment = Alignment.centerRight;
        _showFirst = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            // --------------------------
            // ---- Animated Opacity ----
            AnimatedOpacity(
              opacity: _visible ? 1 : 0,
              duration: const Duration(seconds: 1),
              child: const FlutterLogo(),
            ),
            // Opacity button
            ElevatedButton(
              onPressed: () => setState(() {
                _visible = !_visible;
              }),
              child: const Text("Opacity"),
            ),
            const SizedBox(height: 40),

            // ------------------------
            // ---- Animated Align ----
            AnimatedAlign(
              alignment: _alignment,
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              child: const FlutterLogo(size: 50),
            ),
            // Alignment button
            ElevatedButton(
              onPressed: () => setState(() {
                if (_alignment == Alignment.centerLeft) {
                  _alignment = Alignment.centerRight;
                } else {
                  _alignment = Alignment.centerLeft;
                }
              }),
              child: const Text("Alignment"),
            ),
            const SizedBox(height: 40),

            // -----------------------------
            // ---- Animated Cross Fade ----
            AnimatedCrossFade(
              duration: const Duration(milliseconds: 500),
              firstChild: const FlutterLogo(
                  style: FlutterLogoStyle.horizontal, size: 100.0),
              secondChild: const FlutterLogo(
                  style: FlutterLogoStyle.stacked, size: 100.0),
              crossFadeState: _showFirst
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
            ),
            // Cross fade button
            ElevatedButton(
              onPressed: () => setState(() {
                _showFirst = !_showFirst;
              }),
              child: const Text("Cross Fade"),
            ),
            const SizedBox(height: 40),

            // ----------------------------
            // ---- Animated Container ----
            AnimatedContainer(
              width: _width,
              height: _height,
              color: _color,
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              child: const Center(
                child: FlutterLogo(size: 75),
              ),
            ),
            // Container button
            ElevatedButton(
              onPressed: () => setState(() {
                if (_containerSmall) {
                  _containerSmall = false;
                  _width = 200;
                  _height = 200;
                  _color = Colors.yellow;
                } else {
                  _containerSmall = true;
                  _width = 50;
                  _height = 50;
                  _color = Colors.white;
                }
              }),
              child: const Text("Container"),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
