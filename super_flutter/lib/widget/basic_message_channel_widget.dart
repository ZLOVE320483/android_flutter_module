import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:super_flutter/utils/common_method_channel.dart';

const _messageChannel = BasicMessageChannel<Object>('send_message', StandardMessageCodec());

void receiveMessage() {
  _messageChannel.setMessageHandler((message) {
    print('receive from platform -- $message');
  });
}

Future sendMessage() async {
  String replay = await _messageChannel.send('this is dart');
  print(replay);
  return replay;
}

class BasicMessageChannelWidget extends StatelessWidget {

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
      title: Title(color: Colors.black, child: Text("Basic Message Channel", textDirection: TextDirection.ltr, style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),)),
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

  Widget _buildBody() {
    return Container(
      child: RaisedButton(
        onPressed: sendMessage,
        child: Text('sendMsg'),
      ),
    );
  }
}