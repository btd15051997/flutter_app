import 'package:flutter/material.dart';

class Parenting_Animations extends StatefulWidget {
  @override
  _Parenting_Animations createState() => _Parenting_Animations();
}

class _Parenting_Animations extends State<Parenting_Animations>
    with SingleTickerProviderStateMixin {
  Animation childAnimation;
  AnimationController _animationController;
  bool isReverse = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _animationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);

    childAnimation = Tween(begin: 80.0, end: 150.0).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Scaffold(
          // body: Transform(
          // transform: Matrix4.translationValues(childAnimation.value*2,0.0, 0.0),
          body: Center(
            child: Column(
              children: [
                Container(
                  color: Colors.green,
                  height: childAnimation.value * 2,
                  width: childAnimation.value * 2,
                  child: Text("Parenting Animations"),
                ),
                FlatButton(
                    onPressed: () {
                      _animationController.isCompleted
                          ? _animationController.reverse()
                          : _animationController.forward();
                    },
                    child: Text("Click start animation!"))
              ],
            ),
          ),
          // ),
        );
      },
    );
  }
}
