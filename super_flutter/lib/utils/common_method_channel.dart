import 'package:flutter/services.dart';


const CHANNEL_NAME_COMMON = "common";
const methodChannel = MethodChannel(CHANNEL_NAME_COMMON);

class CommonMethodChannel {
  static finish() async {
    try {
      methodChannel.invokeMethod("finish");
    } on PlatformException catch (e) {
      print("finish:" + e.toString());
    }
  }

  static showToast(String msg) async {
    try {
      methodChannel.invokeMethod('showToast', msg);
    } on PlatformException catch (e) {
      print("showToast: " + e.toString());
    }
  }

  static showKeyboardDialog() async {
    try {
      methodChannel.invokeMethod("showKeyboardDialog");
    } on PlatformException catch (e) {
      print("showKeyboardDialog:" + e.toString());
    }
  }
}