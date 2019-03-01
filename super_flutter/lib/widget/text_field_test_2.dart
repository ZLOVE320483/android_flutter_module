import 'package:flutter/material.dart';

class MyTextFieldWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyTextFieldWidgetState();
}

class MyTextFieldWidgetState extends State<MyTextFieldWidget> {

  @override
  void initState() {
    super.initState();
    print("---initState---");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBodyWidget(context),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Title(
          color: Colors.black,
          child: Text(
            "ListView",
            textDirection: TextDirection.ltr,
            style: TextStyle(
                fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),
          )),
      centerTitle: true,
      elevation: 0.0,
      leading: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Image.asset(
            'assets/uikit_ic_navbar_back_black.png',
            height: 25,
            width: 25,
          ),
        ),
      ),
    );
  }

  Widget _buildBodyWidget(BuildContext context) {
    FocusNode nodeOne = FocusNode();
    return  SafeArea(
      child: Column(
        children: <Widget>[
          Flexible(
              child: ListView.builder(
                  reverse: true,
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return TextListTile(index: index, onTap: () {
                      print("11111");
                      FocusScope.of(context).requestFocus(nodeOne);
                    },);
                  })),
          Divider(
            height: 1.0,
          ),
          _buildInputWidget(context, nodeOne),
        ],
      ),
    );
  }

  Widget _buildInputWidget(BuildContext context, FocusNode nodeOne) {

    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
                child: TextField(
                  focusNode: nodeOne,
                  decoration:
                  InputDecoration.collapsed(hintText: "Send your message"),
                )),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: StreamBuilder(
                initialData: "",
                builder: (context, snapshot) {
                  return IconButton(
                    icon: Icon(
                      Icons.send,
                      color: snapshot.data == ""
                          ? Colors.grey
                          : Theme.of(context).accentColor,
                    ),
                    onPressed: () { },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TextListTile extends StatelessWidget {

  final int index;
  final Function onTap;

  TextListTile({@required this.index, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 70,
        child: Center(
          child: Text(index.toString()),
        ),
      ),
    );
  }
}
