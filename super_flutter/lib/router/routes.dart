import 'dart:async';

import 'package:flutter/material.dart';
import 'package:super_flutter/setting/settings.dart';
import 'package:router/router.dart';

class Routes {
  final routeMap = {
    '/': (context, _) => Material(),
    '/setting': (context, _) => Settings()
  };

  Routes() {
    runZoned<Future<Null>>(() async {
      runApp(RouteApp(routeMap, title: 'Setting', home: null));
    }, onError: (error, stackTrace) async {

    });

  }
}