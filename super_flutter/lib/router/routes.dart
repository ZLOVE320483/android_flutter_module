import 'package:flutter/material.dart';
import 'package:super_flutter/setting/settings.dart';
import 'package:router/router.dart';

class Routes {
  final routeMap = {
    '/': (context, _) => Material(),
    '/setting': (context, _) => Settings()
  };

  Routes() {
    runApp(RouteApp(routeMap, title: 'Setting', home: null));
  }
}