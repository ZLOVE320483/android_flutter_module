import 'package:flutter/material.dart';

class AnimUtils {
  static SlideTransition createRightToLeftTransition(Animation<double> animation, Widget child) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: const Offset(0.0, 0.0),
      ).animate(animation),
      child: child,
    );
  }

  static SlideTransition createBottomToTopTransition(Animation<double> animation, Widget child) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0.0, 1.0),
        end: const Offset(0.0, 0.0),
      ).animate(animation),
      child: child,
    );
  }
}