import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NumberCountingAnimation extends StatefulWidget {
  final int startNumber;
  final int endNumber;
  final Duration duration;
  final Color color;

  const NumberCountingAnimation({super.key,
    required this.startNumber,
    required this.endNumber,
    required this.duration, required this.color,
  });

  @override
  _NumberCountingAnimationState createState() =>
      _NumberCountingAnimationState();
}

class _NumberCountingAnimationState extends State<NumberCountingAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _animation;
  final style =  GoogleFonts.ptSerif();
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this);
    _animation = IntTween(
      begin: widget.startNumber,
      end: widget.endNumber,
    ).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Text( _animation.value.toString(),style: style.copyWith(fontSize: 25,
        fontWeight: FontWeight.bold,color: widget.color),);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
