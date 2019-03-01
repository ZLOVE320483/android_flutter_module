import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_loader/tt_image.dart';

class CustomImage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBodyWidget(),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Title(color: Colors.black, child: Text("CustomImage", textDirection: TextDirection.ltr, style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),)),
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

  Widget _buildBodyWidget() {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            TTImage.drawable('comment_blacksend_pressed', width: 150, height: 100,),
            TTImage.file(new File('/path'), width: 150, height: 100,),
            TTImage.network('url', width: 150, height: 100,)
          ],
        ),

      ),
    );
  }
}