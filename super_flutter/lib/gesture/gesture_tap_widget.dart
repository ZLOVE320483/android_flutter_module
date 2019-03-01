import 'package:flutter/material.dart';

class GestureTapWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Title(color: Colors.black, child: Text("GestureTap", textDirection: TextDirection.ltr, style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),)),
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

  Widget _buildBody() {
    return  GestureDetector(
      onTap: () => print('onTap---111'),
      child: Stack(
        children: <Widget>[
          Container(width: 200, height: 200, color: Colors.red,),
          Container(width: 100, height: 100, color: Colors.blue,),
        ],
      )
    );
  }
}