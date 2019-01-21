import 'dart:async';

import 'package:flutter/material.dart';
import 'package:super_flutter/setting/settings.dart';
import 'package:super_flutter/login/login_page.dart';
import 'package:router/router.dart';
import 'package:super_flutter/anim/scale_anim.dart';

class Routes {

  final routeMap = {
    '/': (context, _) => Material(),
    '/setting': (context, _) => Settings(),
    '/login': (context, _) => LoginPage(),
    '/anim': (context, _) => AnimPage()
  };

  Routes() {

    runZoned<Future<Null>>(() async {
      runApp(RouteApp(routeMap, title: 'Setting', home: null));
    }, onError: (error, stackTrace) async {

    });

  }
}
