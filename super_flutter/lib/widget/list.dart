import 'package:flutter/material.dart';

class ListViewDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildHorizontalList(),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Title(color: Colors.black,
          child: Text("ListView", textDirection: TextDirection.ltr,
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

  Widget _buildHorizontalList() {
    return Container(
      height: 100,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 20,
          itemBuilder: (ctx, index) {
            return TextListTile(index: index);
          }),
    );
  }
}

class TextListTile extends StatelessWidget {

  final int index;

  TextListTile({@required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      child: Center(
        child: Text(index.toString()),
      ),
    );
  }
}