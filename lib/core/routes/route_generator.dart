import 'package:flutter/material.dart';

import '../../features/main_wrapper.dart';
import 'app_routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.initial:
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => const MainWrapper(initialIndex: 0),
          settings: settings,
        );

      case AppRoutes.offers:
        return MaterialPageRoute(
          builder: (_) => const MainWrapper(initialIndex: 1),
          settings: settings,
        );

      case AppRoutes.profile:
        return MaterialPageRoute(
          builder: (_) => const MainWrapper(initialIndex: 2),
          settings: settings,
        );

      case AppRoutes.messages:
        return MaterialPageRoute(
          builder: (_) => const MainWrapper(initialIndex: 3),
          settings: settings,
        );

      case AppRoutes.more:
        return MaterialPageRoute(
          builder: (_) => const MainWrapper(initialIndex: 4),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
