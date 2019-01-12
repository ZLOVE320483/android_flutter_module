import 'dart:async';

import 'package:flutter/material.dart';
import 'package:super_flutter/setting/settings.dart';
import 'package:super_flutter/login/login_page.dart';
import 'package:router/router.dart';

class Routes {

  Routes() {
    final routeMap = {

      '/': (context, _) => Material(),
      '/setting': (context, _) => Settings(),
      '/login': (context, _) => LoginPage()
    };

    runZoned<Future<Null>>(() async {
      runApp(RouteApp(routeMap, title: 'Setting', home: null));
    }, onError: (error, stackTrace) async {

    });

  }
}
