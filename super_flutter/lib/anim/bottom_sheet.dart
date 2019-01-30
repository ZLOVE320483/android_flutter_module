import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyBottomSheet extends StatelessWidget {

  PersistentBottomSheetController controller;
  ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    scrollController = ScrollController();
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Builder(builder: (ctx) {
        return _buildBodyWidget(ctx);
      })
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Title(color: Colors.black,
          child: Text("showBottomSheet", textDirection: TextDirection.ltr,
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
    return Container(
      padding: EdgeInsets.all(12.0),
      child: Column(
        children: <Widget>[
          RaisedButton(child: Text("showBottomSheet"),
            onPressed: () {
              controller = showBottomSheet(context: context, builder: (ctx) {
                return Container(
                  height: 450,
                  color: Colors.black12,
                  child: Listener(
                    onPointerMove: (event) {
                      print("event down --- ${event.delta.dy}");
                      if (event.delta.dy > 0 && scrollController.position.pixels == 0) {
                        controller.close();
                      }
                    },
                    child: Stack(
                      children: <Widget>[
                        ListView.builder(
                            controller: scrollController,
                            itemCount: 20,
                            itemBuilder: (ctx, index) {
                              return TextListTile(index: index);
                            }),
                        Container(
                          margin: EdgeInsets.only(top: 410),
                          height: 50,
                          child: TextField(decoration: InputDecoration(hintText: "111"),),
                        )
                      ],
                    ),
                  ),
                );
              });
            },
          ),
          RaisedButton(
              child: Text("closeBottomSheet"),
              onPressed: () {
                if (controller != null) {
                  controller.close();
                }
              })
        ],
      ),
    );
  }
}

class TextListTile extends StatelessWidget {

  final int index;

  TextListTile({@required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Center(
        child: Text(index.toString()),
      ),
    );
  }
}