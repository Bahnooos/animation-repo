import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieSliderAnimation extends StatefulWidget {
  const LottieSliderAnimation({super.key});
  static const screenRoute = 'Lottie Slider Animation';

  @override
  State<LottieSliderAnimation> createState() => _LottieSliderAnimationState();
}

class _LottieSliderAnimationState extends State<LottieSliderAnimation> {
  final List<String> _pathAnimations = [
    'assets/lottie/bird.json',
    'assets/lottie/tigger.json',
    'assets/lottie/car.json',
  ];
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    _startAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _stopAnimation();
    super.dispose();
  }

  void _startAnimation() {
    Future.delayed(
      const Duration(seconds: 3),
    ).then((value) {
      if (_currentPage == 2) {
        _pageController.animateToPage(0, duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
      } else {
        _pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
      }
       _startAnimation();
    });
   
  }

  void _stopAnimation() {
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lottie Slider Animation'),
        centerTitle: true,
      ),
      body: PageView.builder(
        onPageChanged: (value) {
          setState(() {
            _currentPage = value;
          });
        },
        controller: _pageController,
        itemCount: _pathAnimations.length,
        itemBuilder: (context, index) => Center(
          child: LottieBuilder.asset(_pathAnimations[index]),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentPage,
          onTap: (value) {
            setState(() {
              _pageController.animateToPage(value, duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.animation), label: 'animation1'),
            BottomNavigationBarItem(icon: Icon(Icons.brightness_1), label: 'animation1'),
            BottomNavigationBarItem(icon: Icon(Icons.car_crash_outlined), label: 'animation1'),
          ]),
    );
  }
}
