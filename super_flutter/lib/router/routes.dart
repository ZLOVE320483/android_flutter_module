
import 'package:flutter/material.dart';
import 'package:router/router.dart';
import 'package:super_flutter/login/login_page.dart';
import 'package:super_flutter/router/entrance.dart';

class Routes {
  final routeMap = {
    '/': (context, _) => Material(),
    '/login': (context, _) => LoginPage(),
    '/entrance':(context, _) => FlutterEntrance()
  };

  Routes() {
    runApp(RouteApp(
      routeMap
    ));
  }
}