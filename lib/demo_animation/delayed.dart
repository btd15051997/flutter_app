import 'package:flutter/material.dart';

class DemoDelayed extends StatefulWidget {
  @override
  _DemoOneState createState() => _DemoOneState();
}

class _DemoOneState extends State<DemoDelayed>
    with SingleTickerProviderStateMixin {
  Animation _animation, delayedAnimation, muchDelayedAnimation;
  AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(duration: Duration(seconds: 3), vsync: this);

    /* _animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.bounceIn)
    )..addListener(() {

      if (_animationController.status == AnimationStatus.completed) {
        _animationController.reverse();
      }
      else if (_animationController.status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });*/

    delayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn)));

    muchDelayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.8, 1.0, curve: Curves.easeInSine)));

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform(
                transform: Matrix4.translationValues(
                    delayedAnimation.value * width, 0.0, 0.0),
                child: Center(
                  child: Container(
                    child: RaisedButton(
                      child: Text("Delayed Animation!"),
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
              Transform(
                transform: Matrix4.translationValues(
                    muchDelayedAnimation.value * width, 0.0, 0.0),
                child: Center(
                  child: Container(
                    child: RaisedButton(
                      child: Text("Much Delayed Animation!"),
                      color: Colors.green,
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
