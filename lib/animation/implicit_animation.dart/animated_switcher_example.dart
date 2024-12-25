import 'package:flutter/material.dart';

class AnimatedSwitcherExample extends StatefulWidget {
  const AnimatedSwitcherExample({super.key});
  static const screenRoute = 'AnimatedSwitcher';

  @override
  State<AnimatedSwitcherExample> createState() => _AnimatedSwitcherExampleState();
}

class _AnimatedSwitcherExampleState extends State<AnimatedSwitcherExample> {
  bool _isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Switcher Example'),
      ),
      body: Center(
          child: AnimatedSwitcher(
        switchInCurve: Curves.bounceIn,
        switchOutCurve: Curves.bounceOut,
        duration: const Duration(milliseconds: 400),
        child: _isVisible
            ? ElevatedButton(
                onPressed: () {},
                child: const Text('Login Button'),
              )
            : const CircularProgressIndicator(),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() => _isVisible = !_isVisible);
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
