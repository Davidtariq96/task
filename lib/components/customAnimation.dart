import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:provider/provider.dart';

import '../provider/userProvider.dart';

enum AnimationType {
  fadeIn,
  slideIn,
  slideInFromBottom,
  transform,
  counting,
  slideRight
}

Widget buildCustomAnimatedWidget({
  required AnimationType? animationType,
  required Widget? child,
  bool? faded,
  bool? addSpeed,
  required TickerProvider vsync,
  bool shouldAnimate = true,
}) {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _widthAnimation;
  late Animation<int> countingAnimation;
  Offset currentPosition = Offset.zero; // Store the current position of the widget

  _controller = AnimationController(
    vsync: vsync,
    duration: Duration(
      milliseconds: faded == true ? 7000 : faded == false ? 4000 : addSpeed == true ? 500 : 1000,
    ),
  );

  _animation = Tween<double>(begin: 0.0, end: 5.0).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ),
  );

  _slideAnimation = Tween<Offset>(
    begin: Offset(0, 1), // Slide in from bottom
    end: Offset.zero,
  ).animate(_controller)
    ..addListener(() {
      // Store the current position during animation
      currentPosition = _slideAnimation.value;
    });

  _widthAnimation = Tween<double>(
    begin: 50, // Initial width
    end: 100, // Final width
  ).animate(_controller);

  countingAnimation = IntTween(begin: 1, end: 100).animate(_controller)
    ..addListener(() {
      // Access state if needed
    });

  if (shouldAnimate) {
    _controller.forward();
  }

  Widget animatedChild;
  switch (animationType) {
    case AnimationType.fadeIn:
      animatedChild = FadeTransition(
        opacity: _animation,
        child: child,
      );
      break;
    case AnimationType.slideIn:
      animatedChild = SlideTransition(
        position: _slideAnimation,
        child: child,
      );
      break;
    case AnimationType.slideRight:
      animatedChild = SlideTransition(
        position: _slideAnimation,
        child: child,
      );
      break;
    case AnimationType.slideInFromBottom:
      animatedChild = SlideTransition(
        position: _slideAnimation,
        child: child,
      );
      break;
    case AnimationType.transform:
      animatedChild = AnimatedContainer(
        duration: _controller.duration!, // Match animation duration
        width: _widthAnimation.value,
        height: 50,
        child: InkWell(
          onTap: () {
            // Perform action on tap
          },
          child: child,
        ),
      );
      break;
    default:
      animatedChild = Container();
  }

  if (!shouldAnimate) {
    // If animation is stopped, place the widget at its current position
    animatedChild = Transform.translate(
      offset: currentPosition,
      child: animatedChild,
    );
  }

  return animatedChild;
}


