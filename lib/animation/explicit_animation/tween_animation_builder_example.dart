import 'package:flutter/material.dart';

class TweenAnimationBuilderExample extends StatefulWidget {
  const TweenAnimationBuilderExample({super.key});
  static const screenRoute = 'Tween Animation ';

  @override
  State<TweenAnimationBuilderExample> createState() => _TweenAnimationBuilderExampleState();
}

class _TweenAnimationBuilderExampleState extends State<TweenAnimationBuilderExample> {
  double _opacityValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tween Animation Builder '),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 20,
          children: [
            TweenAnimationBuilder(
              tween: Tween<double>(
                begin: 0,
                end: _opacityValue,
              ),
              duration: const Duration(seconds: 1),
              builder: (context, value, child) => Opacity(
                opacity: value,
                child: child,
              ),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(36)),
              ),
            ),
            ElevatedButton(
              onPressed: () => setState(() => _opacityValue = _opacityValue == 0 ? 1 : 0),
              child: const Text('Animated !!'),
            ),
          ],
        ),
      ),
    );
  }
}
