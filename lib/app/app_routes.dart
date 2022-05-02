import 'package:flutter/material.dart';

import '../features/details/ui/pages/details.page.dart';
import '../features/home/ui/pages/home.page.dart';
import '../features/home/ui/pages/splash.page.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> builder = {
    RouteName.home: (BuildContext context) => const HomePage(),
    RouteName.details: (BuildContext context) => const DetailsPage(),
    RouteName.splash: (BuildContext context) => const SplashPage(),
  };
}

class RouteName {
  static const String splash = 'splash', home = 'home', details = 'details';
}
