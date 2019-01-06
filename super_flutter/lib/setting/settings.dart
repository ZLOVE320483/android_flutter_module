import 'package:flutter/material.dart';

class Settings extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: _buildAppBar(context),
        body: _buildBodyWidget(),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Title(color: Colors.black, child: Text("Settings", textDirection: TextDirection.ltr, style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),)),
      centerTitle: true,
      elevation: 0.0,
      leading: GestureDetector(
        onTap: () {

        },
        child: Padding(padding: EdgeInsets.all(15), child: Image.asset('assets/uikit_ic_navbar_back_black.png', height: 25, width: 25,),),
      ),
    );
  }

  Widget _buildBodyWidget() {
    return Container(decoration: BoxDecoration(color: Colors.white,
                      border: Border(top: BorderSide(width: 1, color: Color(0xFFf8f8f8)))),
                      child: Center(
                        child: Text(
                          "Settings", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue),
                        ),
                      ),
    );
  }
}