import 'package:flutter/material.dart';
import 'package:weather_project/pages/setting_page/settings.dart';
import 'package:weather_project/pages/home_page_weather/home_page.dart';
import 'package:weather_project/utils/route_name.dart';

Map<String, WidgetBuilder> generateRoutes() {
  return {
    route(HomePage): (_) => const HomePage(),
    route(Settings): (_) => const Settings(),
  };
}
