import 'package:flutter/material.dart';

class DefaultTextStyleTransitionExample extends StatefulWidget {
  const DefaultTextStyleTransitionExample({super.key});
  static const screenRoute = 'Default Textstyle Transition ';

  @override
  State<DefaultTextStyleTransitionExample> createState() => _DefaultTextStyleTransitionExampleState();
}

class _DefaultTextStyleTransitionExampleState extends State<DefaultTextStyleTransitionExample> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOutCirc));
  }

  TextStyle style1 = const TextStyle(fontSize: 26, color: Colors.blue);
  TextStyle style2 = const TextStyle(fontSize: 36, color: Colors.blueGrey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Default TextStyle Transition '),
        centerTitle: true,
      ),
      body: Center(
        child: DefaultTextStyleTransition(
          style: _animation.drive(TextStyleTween(begin: style1, end: style2)),
          child: const Text('Bahnasawy'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _controller.status == AnimationStatus.completed ? _controller.reverse() : _controller.forward(),
        child: const Icon(Icons.change_circle),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
