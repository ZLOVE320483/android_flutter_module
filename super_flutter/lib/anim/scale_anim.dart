import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:math' as math;

class AnimPage extends StatelessWidget {

  final GlobalKey<ScaleAnimState> key1 = GlobalKey();
  final GlobalKey<ScaleAnimState> key2 = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),
      body: Container(
        color: Colors.black12,
        child: Center(
          child: RotateAnim(),
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Title(color: Colors.black,
          child: Text("Anim", textDirection: TextDirection.ltr,
            style: TextStyle(fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.black),)),
      centerTitle: true,
      elevation: 0.0,
      leading: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Padding(padding: EdgeInsets.all(15),
          child: Image.asset(
            'assets/uikit_ic_navbar_back_black.png', height: 25, width: 25,),),
      ),
    );
  }
}

class ScaleAnim extends StatefulWidget {

  final Function() onTap;

  ScaleAnim({Key key, this.onTap}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ScaleAnimState();
}

class ScaleAnimState extends State<ScaleAnim> with SingleTickerProviderStateMixin {

  Animation<double> animation;
  AnimationController controller;
  double scale = 1.0;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(milliseconds: 180), vsync: this);
    animation = Tween(begin: 1.0, end: 0.75).animate(controller)
      ..addListener(() {
        setState(() {
          scale = animation.value;
        });
      });
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Center(child: Transform.scale(scale: scale, child: Image.asset('assets/bg_home_add.png', width: 40, height: 40,),),),
      onTap: () {
        controller.forward().then((_) {
          controller.reverse();
        });
        widget.onTap();
      },
    );
  }
}

class RotateAnim extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => RotateAnimState();
}

// assets/icon_home_refresh.png
class RotateAnimState extends State<RotateAnim>
    with SingleTickerProviderStateMixin {

  AnimationController animationController;
  CurvedAnimation curve;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    curve = new CurvedAnimation(parent: animationController, curve: Curves.decelerate);
    animation = Tween(begin: 0.0, end: -1.0).animate(curve);
    animation.addListener(() {
      setState(() {
      });
    });
    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(angle: animation.value * 2 * math.pi,
      child: Image.asset('assets/icon_home_refresh.png'),);

  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }
}