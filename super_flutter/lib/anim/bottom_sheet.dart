import 'package:flutter/material.dart';
import 'package:super_flutter/login/login_page.dart';
import 'package:super_flutter/utils/common_method_channel.dart';

// ignore: must_be_immutable
class MyBottomSheet extends StatelessWidget {

  PersistentBottomSheetController controller;
  ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    scrollController = ScrollController();
    return Scaffold(
      backgroundColor: Colors.red,
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
                  color: Colors.blue,
                  child: ListView.builder(
                      controller: scrollController,
                      itemCount: 20,
                      itemBuilder: (ctx, index) {
                        return TextListTile(index: index);
                      }),
                );
              });
            },
          ),
          RaisedButton(
              child: Text("closeBottomSheet"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                  return LoginPage();
                })).then((value) {
                  print("value-- $value");
                });



//                if (controller != null) {
//                  controller.close();
//                }
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
    return GestureDetector(
      onTap: () {
        CommonMethodChannel.showKeyboardDialog();
      },
      child: Container(
        height: 50,
        child: Center(
          child: Text("showKeyBoardDialog$index", style: TextStyle(fontSize: 20),),
        ),
      ),
    );
  }
}