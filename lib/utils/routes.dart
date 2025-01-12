import 'package:flutter/material.dart';
import 'package:weather_project/Pages/settings.dart';
import 'package:weather_project/Pages/home_page.dart';
import 'package:weather_project/utils/route_name.dart';

Map<String, WidgetBuilder> generateRoutes() {
  return {
    route(HomePage): (_) => const HomePage(),
    route(Settings): (_) => const Settings(),
  };
}
