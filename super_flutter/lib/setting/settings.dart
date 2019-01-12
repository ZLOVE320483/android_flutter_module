import 'package:flutter/material.dart';

class Settings extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),
      body: _buildBodyWidget(context),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Title(color: Colors.black,
          child: Text("Settings", textDirection: TextDirection.ltr,
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

  Widget _buildBodyWidget(BuildContext context) {
    return Container(decoration: BoxDecoration(color: Colors.white,
        border: Border(top: BorderSide(width: 1, color: Color(0xFFf8f8f8)))),
      child: Center(
        child: RaisedButton(onPressed: () {
          _jumpToNative(context);
        }, padding: EdgeInsets.all(10),
          child: Text("Jump To Flutter", style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.bold, color: Colors.blue),),
        ),
      ),
    );
  }

  void _jumpToNative(BuildContext context) {
    Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) {
      return Settings();
    }, transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return createTransition(animation, child);
    }));
  }

  SlideTransition createTransition(Animation<double> animation, Widget child) {
    return new SlideTransition(
      position: new Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: const Offset(0.0, 0.0),
      ).animate(animation),
      child: child,
    );
  }
}