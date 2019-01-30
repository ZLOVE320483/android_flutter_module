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
    return Stack(
      children: <Widget>[
        ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 20,
            itemBuilder: (ctx, index) {
              return TextListTile(index: index);
            }),
        Positioned(child: Container(
          width: 200,
            height: 60,
            child: Center(child: Text("22222"),),
          ),
          bottom: 0,)
      ],
    );
  }
}

class TextListTile extends StatelessWidget {

  final int index;

  TextListTile({@required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: Center(
        child: Text(index.toString()),
      ),
    );
  }
}