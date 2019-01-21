import 'package:flutter/material.dart';

class AnimPage extends StatelessWidget {

  final GlobalKey<ScaleAnimState> key1 = GlobalKey();
  final GlobalKey<ScaleAnimState> key2 = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),
      body: Center(
          child: Column(
            children: <Widget>[
              ScaleAnim(key: key1, onTap: () {
                // ignore: invalid_use_of_protected_member
                key2.currentState.setState(() {

                });
              }),
              ScaleAnim(key: key2, onTap: () {
                // ignore: invalid_use_of_protected_member
                key1.currentState.setState(() {

                });
              }),
            ],
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