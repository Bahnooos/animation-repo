import 'package:flutter/material.dart';

class IndexedStackTransitionExample extends StatefulWidget {
  const IndexedStackTransitionExample({super.key});
  static const screenRoute = 'Indexed Stack Transition';

  @override
  State<IndexedStackTransitionExample> createState() => _IndexedStackTransitionExampleState();
}

class _IndexedStackTransitionExampleState extends State<IndexedStackTransitionExample> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<double> _scaleAnimation;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _scaleAnimation = Tween<double>(begin: .5, end: 1).animate(_controller);
    _controller.forward();
  }

  _goToNextScreen() {
    // _currentIndex += 1;
    // if (_currentIndex == 3) _currentIndex = 0;

     _currentIndex ==2 ? _currentIndex = 0 :_currentIndex++;
    setState(() {
      _controller.reset();
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Position '),
        centerTitle: true,
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          ScaleTransition(
            scale: _scaleAnimation,
            child: FadeTransition(
              opacity: _opacityAnimation,
              child: Container(
                alignment: Alignment.center,
                color: Colors.greenAccent,
                child: Image.asset('assets/images/jerry.png'),
              ),
            ),
          ),
          ScaleTransition(
            scale: _scaleAnimation,
            child: Container(
              alignment: Alignment.center,
              color: Colors.blueAccent,
              child: Image.asset('assets/images/dog.png'),
            ),
          ),
          ScaleTransition(
            scale: _scaleAnimation,
            child: Container(
              alignment: Alignment.center,
              color: Colors.blueGrey,
              child: Image.asset('assets/images/tom.png'),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _goToNextScreen,
        child: const Icon(Icons.arrow_circle_right),
      ),
    );
  }
}
