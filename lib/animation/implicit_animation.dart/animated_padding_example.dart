import 'package:flutter/material.dart';

class AnimatedPaddingExample extends StatefulWidget {
  const AnimatedPaddingExample({super.key});
  static const screenRoute = 'Animated Padding';

  @override
  State<AnimatedPaddingExample> createState() => _AnimatedPaddingExampleState();
}

class _AnimatedPaddingExampleState extends State<AnimatedPaddingExample> {
   bool _isExpanded = false;
  List<String> imagesname = [
    'tom',
    'jerry',
    'jerry',
    'tom'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Padding'),
        centerTitle: true,
      ),
      body: Center(
        child: Center(
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(
              imagesname.length,
              (index) => AnimatedPadding(
                padding: EdgeInsets.all(_isExpanded ? 30.0 : 10.0),
                duration: const Duration(milliseconds: 400),
                curve: Curves.slowMiddle,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.blueGrey,
                  child: Image.asset('assets/images/${imagesname[index]}.png'),
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _isExpanded = !_isExpanded;
          });
        },
        child: Icon(_isExpanded ? Icons.expand : Icons.expand_less_outlined),
      ),
    );
  }
}
