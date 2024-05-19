import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

enum AnimationType { fadeIn, slideIn }

class AnimatedWidget extends StatefulWidget {
  final AnimationType animationType;
  final Widget child;

  const AnimatedWidget({required Key key, required this.animationType, required this.child}) : super(key: key);

  @override
  _AnimatedWidgetState createState() => _AnimatedWidgetState();
}

class _AnimatedWidgetState extends State<AnimatedWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.animationType) {
      case AnimationType.fadeIn:
        return FadeTransition(
          opacity: _animation,
          child: widget.child,
        );
      case AnimationType.slideIn:
        return SlideTransition(
          position: Tween<Offset>(
            begin: Offset(-1, 0),
            end: Offset.zero,
          ).animate(_controller),
          child: widget.child,
        );
      default:
        return Container();
    }
  }
}