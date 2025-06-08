import 'package:flutter/cupertino.dart';
import 'package:talket/presentation/module/home/home_screen.dart';
import 'package:talket/presentation/module/onboarding/onboarding_screen.dart';
import 'package:talket/presentation/module/splash/splash_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreen.routeName:
      return _pageBuilder((context) => const SplashScreen(),
          settings: settings);
    case OnboardingScreen.routeName:
      return _pageBuilder((context) => const OnboardingScreen(),
          settings: settings);
    case HomeScreen.routeName:
      return _pageBuilder((context) => const HomeScreen(), settings: settings);
    default:
      return _pageBuilder((context) => const OnboardingScreen(),
          settings: settings);
  }
}

PageRouteBuilder<dynamic> _pageBuilder(Widget Function(BuildContext) page,
    {required RouteSettings settings}) {
  return PageRouteBuilder(
      settings: settings,
      transitionsBuilder: (_, animation, __, child) => FadeTransition(
            opacity: animation,
            child: child,
          ),
      pageBuilder: (context, _, __) => page(context));
}
