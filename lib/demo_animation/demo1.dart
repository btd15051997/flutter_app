

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DemoOne extends StatefulWidget {
  @override
  _DemoOneState createState() => _DemoOneState();
}

class _DemoOneState extends State<DemoOne> with SingleTickerProviderStateMixin {
  Animation _animation;
  AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);

    _animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn)
    )..addListener(() {

      if (_animationController.status == AnimationStatus.completed) {
        _animationController.reverse();
      }
      else if (_animationController.status == AnimationStatus.dismissed) {
        _animationController.forward();
      }

    });
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context,child){
        return Scaffold(
          body: Transform(
            transform: Matrix4.translationValues(_animation.value*width,0.0, 0.0),
            child: Center(
              child: Container(
                child: Text("Demo with Tween"),
              ),
            ),
          ),
        );
      },
    );
  }
}
