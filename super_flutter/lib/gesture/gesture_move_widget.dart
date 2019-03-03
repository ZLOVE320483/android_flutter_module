import 'package:flutter/material.dart';
import 'package:super_flutter/gesture/custom_gesture.dart';

class GestureMoveWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Title(color: Colors.black, child: Text("GestureMove", textDirection: TextDirection.ltr, style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),)),
      centerTitle: true,
      elevation: 0.0,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Padding(padding: EdgeInsets.all(15), child: Image.asset('assets/uikit_ic_navbar_back_black.png', height: 25, width: 25,),),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return CustomGesture(
      child: Container(color: Colors.red,),
      onDrawGesture: (left) {
        Navigator.pop(context);
      },
    );
  }
}