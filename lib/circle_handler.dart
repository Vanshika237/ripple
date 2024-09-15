import 'package:flutter/material.dart';
import 'package:ripple/circle_painter.dart';

class CircleHandler extends StatefulWidget {
  final Offset center;
  final Function(Key?) onComplete;
  const CircleHandler(
      {super.key, required this.center, required this.onComplete});

  @override
  State<StatefulWidget> createState() => CircleHandlerState();
}

class CircleHandlerState extends State<CircleHandler>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );
    _controller.forward();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onComplete(widget.key);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: Animation.fromValueListenable(_controller, transformer: (val) {
        return _controller.upperBound - val;
      }),
      child: ScaleTransition(
        scale: Tween(begin: 1.0, end: 1.0).animate(CurvedAnimation(
            parent: _controller, curve: Curves.linearToEaseOut)),
        child: CustomPaint(
          painter: CirclePainter(
              center: widget.center, animation: _controller, radius: 30),
        ),
      ),
    );
  }
}
