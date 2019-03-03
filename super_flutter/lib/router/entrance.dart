import 'package:flutter/material.dart';
import 'package:super_flutter/gesture/gesture_move_widget.dart';
import 'package:super_flutter/gesture/gesture_tap_widget.dart';
import 'package:super_flutter/utils/anim_utils.dart';

class FlutterEntrance extends StatelessWidget {

  final List<String> items = ['OnTap','Gesture'];

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
      title: Title(color: Colors.black, child: Text("Entrance", textDirection: TextDirection.ltr, style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),)),
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
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => _jump(context, index),
          child: Container(
            color: Colors.grey,
            height: 50,
            child: Center(child: Text(items[index]),),
          ),
        );
      });
  }

  void _jump(BuildContext context, int index) {
    if (index == 0) {
      Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) {
        return GestureTapWidget();
      }, transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return AnimUtils.createRightToLeftTransition(animation, child);
      }));
    } else if (index == 1) {
      Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) {
        return GestureMoveWidget();
      }, transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return AnimUtils.createRightToLeftTransition(animation, child);
      }));
    }
  }
}