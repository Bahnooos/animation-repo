import 'package:flutter/material.dart';

class CustomPainterExample extends StatefulWidget {
  const CustomPainterExample({super.key});
  static const screenRoute = 'Custom Painter';

  @override
  State<CustomPainterExample> createState() => _CustomPainterExampleState();
}

class _CustomPainterExampleState extends State<CustomPainterExample> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _sizeAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 3));
    _sizeAnimation = Tween<double>(begin: 50, end: 150).animate(_controller);
    _colorAnimation = ColorTween(begin: Colors.green, end: Colors.blueGrey).animate(CurvedAnimation(parent: _controller, curve: Curves.decelerate));
    _controller.repeat(reverse: true);
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
        title: const Text('Custom Painter  '),
        centerTitle: true,
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) => CustomPaint(
            painter: CirclePainter(parentSize: _sizeAnimation.value, color: _colorAnimation.value??Colors.amber),
            size: const Size.square(200),
          ),
        ),
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  const CirclePainter({required this.color, required this.parentSize});
  final double parentSize;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = color;
    paint.style = PaintingStyle.fill;
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), parentSize, paint);
  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) {
    return (parentSize != oldDelegate.parentSize || color != oldDelegate.color);
  }
}
