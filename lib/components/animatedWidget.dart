import 'package:flutter/material.dart';
// import 'package:animations/animations.dart';
import 'package:provider/provider.dart';

import '../provider/userProvider.dart';

enum AnimationType { fadeIn, slideIn,slideInFromBottom,transform,counting,slideRight,slideInFromTop }

class CustomAnimatedWidget extends StatefulWidget {
  final AnimationType? animationType;
  final Widget? child;
  final bool? faded;
  final bool? addSpeed;
  final bool? isLocation;
  final bool? fastSlide;
  final GlobalKey<CustomAnimatedWidgetState> key;
  final GlobalKey<CustomAnimatedWidgetState>count;
   CustomAnimatedWidget({ Key? key,  this.animationType, this.child,  this.faded, this.addSpeed, this.fastSlide, this.isLocation, }) :
         key = GlobalKey<CustomAnimatedWidgetState>(),
         count=GlobalKey<CustomAnimatedWidgetState>(),
         super(key: key);

  @override
  CustomAnimatedWidgetState createState() => CustomAnimatedWidgetState();
}

class CustomAnimatedWidgetState extends State<CustomAnimatedWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<Offset> _slideAnimation;
  late Animation<Offset> _slideTopAnimation;
  late Animation<double> _widthAnimation;
  late Animation<int> countingAnimation;
  bool forward = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration:  Duration(milliseconds:widget.faded == true ? 7000:
      widget.faded == false?4000:widget.addSpeed == true ? 500: widget.isLocation ==true? 550:1000),
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
    ).animate(_controller);
    _slideTopAnimation = Tween<Offset>(
      begin: Offset(0, -1), // Slide in from bottom
      end: Offset.zero,
    ).animate(_controller);

    _widthAnimation = Tween<double>(
      begin: 50, // Initial width
      end: 100, // Final width
    ).animate(_controller);
    countingAnimation = IntTween(begin: 1, end: 100).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _controller.forward();
  }
  void repeatAnimation() {
    _controller.reset();
  }
  int offerCount () => countingAnimation.value;
  bool get isForwardAnimation =>
     _controller.status == AnimationStatus.forward ||
         _controller.status == AnimationStatus.completed;


  Future toggleHeader() => isForwardAnimation ? _controller.reverse() :_controller.forward();

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
            begin:  Offset(widget.fastSlide==true?-10:-1, 0),
            end: Offset.zero,
          ).animate(_controller),
          child: widget.child,
        );
      case AnimationType.slideRight:
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(_controller),
          child: widget.child,
        );
      case AnimationType.slideInFromBottom:
        return SlideTransition(
          position: _slideAnimation,
          child: widget.child,
        );
      case AnimationType.slideInFromTop:
        return SlideTransition(
          position: _slideTopAnimation,
          child: widget.child,
        );
      case AnimationType.transform:
        return AnimatedContainer(
          duration: _controller.duration!,
          width: _widthAnimation.value,
          height: 50,
          child: InkWell(onTap: (){
            toggleHeader();
            Provider.of<UserProvider>(context,listen: false).setExpand(isForwardAnimation);
          },
              child: widget.child,
            ),
        );
      default:
        return Container();
    }
  }
}