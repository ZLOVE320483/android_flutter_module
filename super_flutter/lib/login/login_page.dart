import 'package:flutter/material.dart';
import 'package:super_flutter/utils/common_method_channel.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: _buildAppBar(context),
        body: _buildBodyWidget(),
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

  Widget _buildBodyWidget() {
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
              _login(_phoneController.text, _passwordController.text);
            }, color: Colors.blue, child: Text("Login", style: TextStyle(color: Colors.white),),),
          ),
        )
      ],
    );
  }

  void _login(String phone, String password) {
    print("$phone, $password");
  }
}