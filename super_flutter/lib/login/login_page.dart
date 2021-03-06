import 'package:flutter/material.dart';
import 'package:super_flutter/utils/common_method_channel.dart';
import 'package:super_flutter/widget/custom_image.dart';
import 'package:super_flutter/widget/marquee_continuous.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: _buildAppBar(context),
        body: _buildBodyWidget(context),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Title(color: Colors.black, child: Text("Login", textDirection: TextDirection.ltr, style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),)),
      centerTitle: true,
      elevation: 0.0,
      leading: GestureDetector(
        onTap: () {
          CommonMethodChannel.finish();
        },
        child: Padding(padding: EdgeInsets.all(15), child: Image.asset('assets/uikit_ic_navbar_back_black.png', height: 25, width: 25,),),
      ),
    );
  }

  Widget _buildBodyWidget(BuildContext context) {
    final TextEditingController _phoneController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10.0),
          child: TextField(
            controller: _phoneController,
            decoration: InputDecoration(contentPadding: EdgeInsets.only(top: 10.0), hintText: "phone", icon: Icon(Icons.phone)),
            keyboardType: TextInputType.phone,
          ),
        ),
        Container(
          padding: EdgeInsets.all(10.0),
          child: TextField(
            controller: _passwordController,
            decoration: InputDecoration(contentPadding: EdgeInsets.only(top: 10.0), hintText: "password", icon: Icon(Icons.lock)),
            obscureText: true,
          ),
        ),
        Container(
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: RaisedButton(onPressed: () {
              _login(_phoneController.text, _passwordController.text, context);
            }, color: Colors.blue, child: Text("Login", style: TextStyle(color: Colors.white),),),
          ),
        ),
        Container(
          width: 30,
          height: 30,
          child: Material(
            child: GestureDetector(
              onTap: () { },
              child: Icon(Icons.done, color: Colors.red,),
            ),
            borderRadius: BorderRadius.circular(90.0),
            color: Colors.blue,),
        ),

        Container(
          height: 40.0,
          child: MarqueeContinuous(
            child: Container(
              padding: EdgeInsets.all(8.0),
              // add padding to separate
              child: Text('this is a short but continous shown text.'),),),),
    ],
    );
  }

  void _login(String phone, String password, BuildContext context) {


    Navigator.push(context, MaterialPageRoute(builder: (ctx) {
      return CustomImage();
    }));
  }
}

