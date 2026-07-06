import 'package:flutter/material.dart';

import '../pages/Login/index.dart';
import '../pages/Main/index.dart';

Widget getRootWidget() {
  return MaterialApp(routes: getRoutes(), initialRoute: "/");
}

Map<String, WidgetBuilder> getRoutes() {
  return {
    "/": (BuildContext context) => LoginPage(),
    "/main": (BuildContext context) => MainPage(),
  };
}
