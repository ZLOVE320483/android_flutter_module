import 'dart:async';

import 'package:flutter/material.dart';
import 'package:super_flutter/anim/bottom_sheet.dart';
import 'package:super_flutter/anim/my_bottom_sheet.dart';
import 'package:super_flutter/setting/settings.dart';
import 'package:super_flutter/login/login_page.dart';
import 'package:router/router.dart';
import 'package:super_flutter/anim/scale_anim.dart';
import 'package:super_flutter/widget/list.dart';
import 'package:super_flutter/widget/text_field_test.dart';
import 'package:super_flutter/widget/text_field_test_2.dart';

class Routes {

  final routeMap = {
    '/': (context, _) => Material(),
    '/setting': (context, _) => Settings(),
    '/login': (context, _) => LoginPage(),
    '/anim': (context, _) => AnimPage(),
    '/bottom_sheet': (context, _) => ListDemo(),
    '/list': (context, _) => ListViewDemo(),
    '/text_field': (context, _) => MyTextFieldWidget()
  };

  Routes() {

    runZoned<Future<Null>>(() async {
      runApp(RouteApp(routeMap, title: 'Setting', home: null));
    }, onError: (error, stackTrace) async {

    });

  }
}
